﻿namespace Poker.Common
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.Linq;

    public class PokerHandsChecker : IPokerHandsChecker
    {
        public bool IsValidHand(IHand hand)
        {
            IList<ICard> cardsInHand = hand.Cards;

            if (cardsInHand.Count != 5)
            {
                return false;
            }

            for (int i = 0; i < cardsInHand.Count - 1; i++)
            {
                if (cardsInHand[i].ToString() == cardsInHand[i + 1].ToString())
                {
                    return false;
                }
            }

            return true;
        }

        public bool IsStraightFlush(IHand hand)
        {
            if (this.IsFlush(hand) && this.IsStraight(hand))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsFourOfAKind(IHand hand)
        {
            if (!this.IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for four of a king in invalid hand!");
            }

            if (MostOccuringCardCount(hand) == 4)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsFullHouse(IHand hand)
        {
            if (!this.IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check an invalid hand!");
            }

            IDictionary<CardFace, int> cardFaceOccurences = this.GetCardFaceOccurences(hand);
            int firstCardOccurencesCount = cardFaceOccurences.Values.ElementAt(0);
            int secondCardOccurencesCount = cardFaceOccurences.Values.ElementAt(1);

            if (firstCardOccurencesCount == 3 && secondCardOccurencesCount == 2)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsFlush(IHand hand)
        {
            if (!this.IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for flush in invalid hand!");
            }

            var cardsInHand = hand.Cards;
            var suitForFlush = cardsInHand[0].Suit;
            var isFlush = true;

            foreach (var card in cardsInHand)
            {
                if (card.Suit != suitForFlush)
                {
                    isFlush = false;
                }
            }

            return isFlush;
        }

        public bool IsStraight(IHand hand)
        {
            if (!IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for a straight in invalid hand!");
            }

            if (!this.IsFlush(hand))
            {
                Dictionary<CardFace, int> cardFaceOccurences = GetCardFaceOccurences(hand);
                cardFaceOccurences = cardFaceOccurences.OrderBy(x => x.Value).
                    ThenBy(x => x.Key).ToDictionary(x => x.Key, x => x.Value);
                bool isHandSequential = true;
                bool startsWithAce = cardFaceOccurences.ElementAt(4).Key == CardFace.Ace;

                int endIndex;
                if (startsWithAce)
                {
                    endIndex = 1;
                }
                else
                {
                    endIndex = 0;
                }

                for (int i = 0; i < cardFaceOccurences.Count - 1 - endIndex; i++)
                {
                    if (cardFaceOccurences.ElementAt(i).Key != cardFaceOccurences.ElementAt(i + 1).Key - 1)
                    {
                        isHandSequential = false;
                        break;
                    }
                }

                return isHandSequential;
            }
            else
            {
                return false;
            }
        }

        public bool IsThreeOfAKind(IHand hand)
        {
            if (!IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for three of a king in invalid hand!");
            }

            if (MostOccuringCardCount(hand) == 3 && !IsFullHouse(hand))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsTwoPair(IHand hand)
        {
            if (!IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for two pairs in invalid hand!");
            }

            if (this.NumberOfPairs(hand) == 2)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool IsOnePair(IHand hand)
        {
            if (!IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for a pair in invalid hand!");
            }

            if (this.NumberOfPairs(hand) == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsHighCard(IHand hand)
        {
            if (!this.IsValidHand(hand))
            {
                throw new ArgumentException("Cannot check for high card in invalid hand!");
            }

            IDictionary<CardFace, int> cardFaceOccurences = GetCardFaceOccurences(hand);
            int mostCardOccurences = cardFaceOccurences.Max(x => x.Value);
            var isHighCard = (mostCardOccurences == 1 && !this.IsStraight(hand) && !this.IsFlush(hand));
            return isHighCard;
        }

        public int CompareHands(IHand firstHand, IHand secondHand)
        {
            throw new NotImplementedException();
        }

        private Dictionary<CardFace, int> GetCardFaceOccurences(IHand hand)
        {
            Debug.Assert(hand != null, "Hand cannot be null!");
            Debug.Assert(this.IsValidHand(hand), "Cannot process an invalid hand!");
            Dictionary<CardFace, int> cardFaceOccurences = new Dictionary<CardFace, int>();
            foreach (var card in hand.Cards)
            {
                if (cardFaceOccurences.ContainsKey(card.Face))
                {
                    cardFaceOccurences[card.Face]++;
                }
                else
                {
                    cardFaceOccurences.Add(card.Face, 1);
                }
            }

            cardFaceOccurences = cardFaceOccurences.OrderByDescending(x => x.Value).ToDictionary(x => x.Key, x => x.Value);
            return cardFaceOccurences;
        }

        private int NumberOfPairs(IHand hand)
        {
            Debug.Assert(hand != null, "Hand cannot be null!");
            Debug.Assert(this.IsValidHand(hand), "Cannot process an invalid hand!");
            IDictionary<CardFace, int> cardFaceOccurences = GetCardFaceOccurences(hand);
            int firstCardOccurencesCount = cardFaceOccurences.Values.ElementAt(0);
            int secondCardOccurencesCount = cardFaceOccurences.Values.ElementAt(1);
            int pairsCount = 0;

            if (firstCardOccurencesCount == 2 && secondCardOccurencesCount != 2)
            {
                pairsCount = 1;
            }
            else if (firstCardOccurencesCount == 2 && secondCardOccurencesCount == 2)
            {
                pairsCount = 2;
            }

            return pairsCount;
        }

        private int MostOccuringCardCount(IHand hand)
        {
            Debug.Assert(hand != null, "Hand cannot be null!");
            Debug.Assert(this.IsValidHand(hand), "Cannot process an invalid hand!");
            IDictionary<CardFace, int> cardFaceOccurences = GetCardFaceOccurences(hand);
            int mostCardOccurences = cardFaceOccurences.Max(x => x.Value);
            return mostCardOccurences;
        }
    }
}
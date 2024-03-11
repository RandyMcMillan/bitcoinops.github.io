---
title: 'Bitcoin Optech Newsletter #293'
permalink: /en/newsletters/2024/03/13/
name: 2024-03-13-newsletter
slug: 2024-03-13-newsletter
type: newsletter
layout: newsletter
lang: en
---
This week's newsletter summarizes a post about trustless onchain betting
for potential soft forks and links to a detailed overview of Chia Lisp
for Bitcoiners.  Also included are our regular sections summarizing a
Bitcoin Core PR Review Club meeting, announcing new releases and release
candidates, and describing notable changes to popular Bitcoin
infrastructure software.

## News

- **Trustless onchain betting on potential soft forks:** ZmnSCPxj
  [posted][zmnscpxj bet] to Delving Bitcoin a protocol for giving
  control over a UTXO to a party that correctly predicts whether or not
  a particular soft fork will activate.  For example, Alice thinks a
  particular soft fork will activate and she's interested in acquiring
  more bitcoins; Bob is also interested in acquiring more bitcoins but
  does not think that fork will activate.  They agree to combine some
  amount of their bitcoins, at a ratio they both agree upon (e.g. 1:1),
  so that Alice receives all of the combined bitcoins if the fork
  activates by a certain time and Bob receives all of the combined
  bitcoins if it does not.  If, before the deadline, a persistent
  chainsplit occurs where one chain activates the fork and the other
  forbids it, Alice receives the combined bitcoins on the activated
  chain and Bob receives the combined bitcoins on the
  activation-forbidden chain.

    The basic idea has been proposed before ([example][rubin bet]) but
    ZmnSCPxj's version deals with the specifics expected for at least
    one potential future soft fork, [OP_CHECKTEMPLATEVERIFY][topic
    op_checktemplateverify].  ZmnSCPxj also briefly considers the
    challenges of generalizing the construction to other proposed soft
    forks, particularly those that upgrade an `OP_SUCCESSx` opcode.

- **Overview of Chia Lisp for Bitcoiners:** Anthony Towns [posted][towns
  lisp] to Delving Bitcoin a detailed overview of the [Lisp][] variant
  used by the Chia cryptocurrency.  Towns has previously proposed a soft
  fork introduction of a Lisp-based scripting language for Bitcoin (see
  [Newsletter #191][news191 lisp]).  Anyone interested in the topic is
  strongly encouraged to read his post.

## Bitcoin Core PR Review Club

*In this monthly section, we summarize a recent [Bitcoin Core PR Review
Club][] meeting, highlighting some of the important questions and
answers.  Click on a question below to see a summary of the answer from
the meeting.*

FIXME:LarryRuane

{% include functions/details-list.md
  q0="FIXME"
  a0="FIXME"
  a0link="https://bitcoincore.reviews/28950#l-FIXME"
%}

## Releases and release candidates

*New releases and release candidates for popular Bitcoin infrastructure
projects.  Please consider upgrading to new releases or helping to test
release candidates.*

- [Core Lightning v24.02.1][] is a minor update to this LN node
  containing "a few minor fixes [and] improvements in the cost function
  of the routing algorithm."

- [Bitcoin Core 26.1rc1][] is a release candidate for a maintenance release
  of the network's predominant full node implementation.

- [Bitcoin Core 27.0rc1][] is a release candidate for the next major
  version of the network's predominant full node implementation.

## Notable code and documentation changes

_Notable recent changes in [Bitcoin Core][bitcoin core repo], [Core
Lightning][core lightning repo], [Eclair][eclair repo], [LDK][ldk repo],
[LND][lnd repo], [libsecp256k1][libsecp256k1 repo], [Hardware Wallet
Interface (HWI)][hwi repo], [Rust Bitcoin][rust bitcoin repo], [BTCPay
Server][btcpay server repo], [BDK][bdk repo], [Bitcoin Improvement
Proposals (BIPs)][bips repo], [Lightning BOLTs][bolts repo],
[Bitcoin Inquisition][bitcoin inquisition repo], and [BINANAs][binana
repo]._

- [LND #8136][] updates the `EstimateRouteFee` RPC to accept an invoice
  and a timeout.  A route for paying the invoice will be selected and a
  [payment probe][topic payment probes] will be sent.  If the probe
  successfully completes before the timeout is reached, the cost of using
  the chosen route will be returned.  Otherwise, an error will be
  returned.

- [LND #8499][] makes significant changes to the Type-Length-Value (TLV)
  types used for [simple taproot channels][topic simple taproot
  channels] in order to improve LND's API for it.  We aren't aware of any
  other LN implementations currently using simple taproot channels, but if
  any are using it, be aware that this may constitute a breaking change.

- [LDK #2916][] adds a simple API for converting a payment preimage into
  a payment hash.  An LN invoice includes a payment hash; to claim a
  payment, the ultimate receiver releases the preimage corresponding to
  that hash (and each hop along the path uses the preimage it receives
  from its downstream peer to claim the payment from its upstream peer).
  Since a hash can be derived from a preimage (but not vice versa),
  receivers and forwarding nodes may only store the preimage.  This API
  allows them to easily derive the hash on demand.

{% assign day_after_posting = page.date | date: "%s" | plus: 86400 | date: "%Y-%m-%d 14:00" %}
{% include snippets/recap-ad.md when=day_after_posting %}
{% include references.md %}
{% include linkers/issues.md v=2 issues="8136,8499,2916" %}
[zmnscpxj bet]: https://delvingbitcoin.org/t/economic-majority-signaling-for-op-ctv-activation/635
[rubin bet]: https://blog.bitmex.com/taproot-you-betcha/
[news191 lisp]: /en/newsletters/2022/03/16/#using-chia-lisp
[towns lisp]: https://delvingbitcoin.org/t/chia-lisp-for-bitcoiners/636
[lisp]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
[bitcoin core 26.1rc1]: https://bitcoincore.org/bin/bitcoin-core-26.1/
[Bitcoin Core 27.0rc1]: https://bitcoincore.org/bin/bitcoin-core-27.0/test.rc1/
[Core Lightning v24.02.1]: https://github.com/ElementsProject/lightning/releases/tag/v24.02.1
---
title: 'Bitcoin Optech Newsletter #281'
permalink: /en/newsletters/2023/12/13/
name: 2023-12-13-newsletter
slug: 2023-12-13-newsletter
type: newsletter
layout: newsletter
lang: en
---
This week's newsletter summarizes a discussion about griefing liquidity
advertisements and includes our regular sections describing changes to
services and client software, summarizing popular questions and answers
of the Bitcoin Stack Exchange, announcing new software releases and
release candidates, and examining recent changes to popular Bitcoin
infrastructure software.

## News

- **Discussion about griefing liquidity ads:** Bastien Teinturier
  [posted][teinturier liqad] to the Lightning-Dev mailing list about a
  potential problem with timelocks on [dual-funded channels][topic dual
  funding] created from [liquidity advertisements][topic liquidity
  advertisements].  This was also previously mentioned in [Recap
  #279][recap279 liqad]. For example, Alice advertises that, for a fee, she's
  willing to commit 10,000 sats of her funds to a channel for 28 days.
  The 28-day timelock prevents Alice from simply closing the channel
  after she receives payment and using her funds for something else.

    Continuing the example, Bob opens the channel with an additional
    contribution of 100,000,000 sats (1 BTC) of his funds.  He then
    sends almost all of his funds through the channel.  Now Alice's
    balance in the channel isn't the 10,000 sats she received a fee
    for---it's almost 10,000 times higher than that amount.  If Bob is
    malicious, he won't allow those funds to move again until the
    expiration of the 28-day timelock to which Alice committed.

    A mitigation suggested by Teinturier and discussed by him and others
    was to only apply the timelock to the liquidity contribution
    (e.g., only Alice's 10,000 sats).  This introduces
    complexities and inefficiencies, although it may solve the problem.
    An alternative that Teinturier proposed was simply dropping the
    timelock (or making it optional) and letting liquidity buyers take
    the risk that providers may close channels shortly after receiving
    their liquidity fees.  If channels opened through liquidity ads
    typically generate significant forwarding fee income, there would be
    an incentive to keep channels open.

## Changes to services and client software

*In this monthly feature, we highlight interesting updates to Bitcoin
wallets and services.*

FIXME:bitschmidty

## Selected Q&A from Bitcoin Stack Exchange

*[Bitcoin Stack Exchange][bitcoin.se] is one of the first places Optech
contributors look for answers to their questions---or when we have a
few spare moments to help curious or confused users.  In
this monthly feature, we highlight some of the top-voted questions and
answers posted since our last update.*

{% comment %}<!-- https://bitcoin.stackexchange.com/search?tab=votes&q=created%3a1m..%20is%3aa
nswer -->{% endcomment %}
{% assign bse = "https://bitcoin.stackexchange.com/a/" %}

FIXME:bitschmidty

## Releases and release candidates

*New releases and release candidates for popular Bitcoin infrastructure
projects.  Please consider upgrading to new releases or helping to test
release candidates.*

- [LND 0.17.3-beta][] is a release that contains several bug fixes,
  including a reduction in memory when used with the Bitcoin Core
  backend.

## Notable code and documentation changes

*Notable recent changes in [Bitcoin Core][bitcoin core repo], [Core
Lightning][core lightning repo], [Eclair][eclair repo], [LDK][ldk repo],
[LND][lnd repo], [libsecp256k1][libsecp256k1 repo], [Hardware Wallet
Interface (HWI)][hwi repo], [Rust Bitcoin][rust bitcoin repo], [BTCPay
Server][btcpay server repo], [BDK][bdk repo], [Bitcoin Improvement
Proposals (BIPs)][bips repo], [Lightning BOLTs][bolts repo], and
[Bitcoin Inquisition][bitcoin inquisition repo].*

- [LDK #2685][] adds the ability to obtain block chain data from an
  Electrum-style server.

- [Libsecp256k1 #1446][] removes some x86_64 assembly code from the
  project, switching to using existing C language code that has always
  been used for other platforms.  The assembly code was human-optimized
  several years ago to improve performance but, in the meantime, compilers
  improved and recent versions of both GCC and LLVM (clang) now produce
  even more performant code.

- [BTCPay Server #5389][] adds support for [BIP129][] secure multisig
  wallet setup (see [Newsletter #136][news136 bip129]).  This allows
  BTCPay server to interact with multiple software wallets and hardware
  signing devices as part of a simple coordinated multisig setup
  procedure.

- [BTCPay Server #5490][] begins using [fee estimates][ms fee api] from
  [mempool.space][] by default, with a fallback on fee estimates from
  the local Bitcoin Core node.  Developers commenting on the PR noted
  that they felt Bitcoin Core's fee estimates fail to respond quickly to
  changes in the local mempool.  For previous related discussion about
  the challenges to improving fee estimation accuracy, see [Bitcoin Core
  #27995][].

## Happy holidays!

This is Bitcoin Optech's final regular newsletter of the year.  On
Wednesday, December 20th, we'll publish our sixth annual year-in-review
newsletter.  Regular publication will resume on Wednesday, January 3rd.

{% assign day_after_posting = page.date | date: "%s" | plus: 86400 | date: "%Y-%m-%d 15:00" %}
{% include snippets/recap-ad.md when=day_after_posting %}
{% include references.md %}
{% include linkers/issues.md v=2 issues="2685,5389,5490,1446,27995" %}
[LND 0.17.3-beta]: https://github.com/lightningnetwork/lnd/releases/tag/v0.17.3-beta
[teinturier liqad]: https://lists.linuxfoundation.org/pipermail/lightning-dev/2023-December/004227.html
[ms fee api]: https://mempool.space/docs/api/rest#get-recommended-fees
[mempool.space]: https://mempool.space/
[news136 bip129]: /en/newsletters/2021/02/17/#securely-setting-up-multisig-wallets
[recap279 liqad]: /en/podcast/2023/11/30/#update-to-the-liquidity-ads-specification-transcript
[news182 block1983702]: /en/newsletters/2022/01/12/#bitcoin-core-23882
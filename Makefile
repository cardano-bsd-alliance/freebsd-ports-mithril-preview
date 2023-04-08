PORTNAME=               mithril
#DISTVERSIONPREFIX=     v
DISTVERSIONSUFFIX=      -prerelease
DISTVERSION=            2313.0
CATEGORIES=             net-p2p

MAINTAINER=             boris@zfs.ninja
COMMENT=                Stake-based Threshold Multisignatures on Cardano
WWW=                    https://mithril.network/

LICENSE=                APACHE20

USES=           cargo ssl
USE_GITHUB=     yes
GH_ACCOUNT=     input-output-hk

USE_RC_SUBR=    mithril_signer_preview

CARGO_INSTALL=  yes

PLIST_FILES=    bin/mithril-signer \
                bin/mithril-client \
                bin/mithril-aggregator

CARGO_INSTALL_PATH=     ${PLIST_FILES:Mbin/*:T}

.include <bsd.port.mk>

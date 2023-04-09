PORTNAME=		mithril
#DISTVERSIONPREFIX=	v
DISTVERSIONSUFFIX=	-prerelease
DISTVERSION=		2313.0
CATEGORIES=		net-p2p

MAINTAINER=		boris@zfs.ninja
COMMENT=		Stake-based Threshold Multisignatures on Cardano
WWW=			https://mithril.network/

LICENSE=	APACHE20

RUN_DEPENDS=	cardano-node:net-p2p/cardano-node

USES=		cargo ssl
USE_GITHUB=	yes
GH_ACCOUNT=	input-output-hk

USE_RC_SUBR=	mithril_signer_preview

PLIST_FILES=	bin/mithril-signer \
		bin/mithril-client \
		bin/mithril-aggregator

CARGO_INSTALL_PATH=	${PLIST_FILES:Mbin/*:T}

.include <bsd.port.mk>

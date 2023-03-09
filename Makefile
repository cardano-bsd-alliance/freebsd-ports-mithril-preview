PORTNAME=		mithril
#DISTVERSIONPREFIX=	v
DISTVERSIONSUFFIX=	-prerelease
DISTVERSION=		2310.0
CATEGORIES=		net-p2p

MAINTAINER=		boris@zfs.ninja
COMMENT=		Stake-based Threshold Multisignatures on Cardano
WWW=			https://mithril.network/

LICENSE=		APACHE20
LICENSE_FILE_APACHE20=	${WRKSRC}/LICENSE

USES=		cargo ssl
USE_GITHUB=	yes
GH_ACCOUNT=	input-output-hk

USE_RC_SUBR=	mithril_signer_preview

CARGO_ENV=	OPENSSL_LIB_DIR=${OPENSSLLIB} OPENSSL_INCLUDE_DIR=${OPENSSLINC}

CARGO_INSTALL=	no

.sinclude "${.CURDIR}/Makefile.crates"

PLIST_FILES=	bin/mithril-signer \
		bin/mithril-client \
		bin/mithril-aggregator

do-install:
	${CARGO_CARGO_RUN} install \
		--no-track \
		--path "${WRKSRC}/mithril-signer" \
		--root "${STAGEDIR}${PREFIX}" \
		--verbose \
		--verbose
		
	${CARGO_CARGO_RUN} install \
		--no-track \
		--path "${WRKSRC}/mithril-client" \
		--root "${STAGEDIR}${PREFIX}" \
		--verbose \
		--verbose

	${CARGO_CARGO_RUN} install \
		--no-track \
		--path "${WRKSRC}/mithril-aggregator" \
		--root "${STAGEDIR}${PREFIX}" \
		--verbose \
		--verbose
		
.include <bsd.port.mk>

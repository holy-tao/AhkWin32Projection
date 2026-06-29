#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import ".\CRL_ENTRY.ahk" { CRL_ENTRY }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_REVOCATION_INFO {
    #StructPack 8

    pCrlEntry : CRL_ENTRY.Ptr

    pCrlContext : CRL_CONTEXT.Ptr

    pCrlIssuerChain : CERT_CHAIN_CONTEXT.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Security\Cryptography\CERT_CHAIN_CONTEXT.ahk" { CERT_CHAIN_CONTEXT }
#Import "..\..\Security\Authentication\Identity\SecPkgContext_CipherInfo.ahk" { SecPkgContext_CipherInfo }
#Import "..\..\Security\Authentication\Identity\SecPkgContext_ConnectionInfo.ahk" { SecPkgContext_ConnectionInfo }
#Import "..\..\Security\Authentication\Identity\SEC_CHANNEL_BINDINGS.ahk" { SEC_CHANNEL_BINDINGS }
#Import "..\..\Security\Authentication\Identity\SecPkgContext_Bindings.ahk" { SecPkgContext_Bindings }
#Import "..\..\Security\Cryptography\ALG_ID.ahk" { ALG_ID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_SECURITY_INFO {
    #StructPack 8

    dwSize : UInt32

    pCertificate : CERT_CONTEXT.Ptr

    pcCertChain : CERT_CHAIN_CONTEXT.Ptr

    connectionInfo : SecPkgContext_ConnectionInfo

    cipherInfo : SecPkgContext_CipherInfo

    pcUnverifiedCertChain : CERT_CHAIN_CONTEXT.Ptr

    channelBindingToken : SecPkgContext_Bindings

}

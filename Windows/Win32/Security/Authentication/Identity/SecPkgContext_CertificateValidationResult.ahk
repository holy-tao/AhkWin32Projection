#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_CertificateValidationResult {
    #StructPack 4

    dwChainErrorStatus : UInt32

    hrVerifyChainStatus : HRESULT

}

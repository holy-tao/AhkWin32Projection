#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK.ahk" { PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SERVER_OCSP_RESPONSE_OPEN_PARA {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

    pcbUsedSize : IntPtr

    pwszOcspDirectory : PWSTR

    pfnUpdateCallback : PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK

    pvUpdateCallbackArg : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The SecPkgContext_KeyingMaterialInfo structure contains information about the exportable keying material in a security context.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_keyingmaterialinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_KeyingMaterialInfo {
    #StructPack 8

    /**
     * The length, in bytes, of the disambiguating ASCII label, including NUL terminator.
     */
    cbLabel : UInt16

    /**
     * A NUL-terminated ASCII string. The NUL terminator will be removed by schannel before mixing in pszLabel. 
     * 
     * IANA-registered labels should begin with "EXPORTER" to  avoid collisions with existing PRF labels. Labels beginning with "EXPERIMENTAL" may be used without registration.
     */
    pszLabel : PSTR

    cbContextValue : UInt16

    /**
     * The pointer to the application context. Must be <b>NULL</b> if <i>cbContextValue</i> is zero.
     */
    pbContextValue : IntPtr

    /**
     * The length, in bytes, of the keying material to be generated. Must be greater than zero.
     */
    cbKeyingMaterial : UInt32

}

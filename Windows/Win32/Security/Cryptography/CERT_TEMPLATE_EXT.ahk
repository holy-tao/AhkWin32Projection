#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A certificate template.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_template_ext
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_TEMPLATE_EXT {
    #StructPack 8

    /**
     * <b>LPSTR</b> object identifier (OID).
     */
    pszObjId : PSTR

    /**
     * <b>DWORD</b> indicating the major version of the template.
     */
    dwMajorVersion : UInt32

    /**
     * <b>BOOL</b> flag set to <b>TRUE</b> if there is a minor version number.
     */
    fMinorVersion : BOOL

    /**
     * <b>DWORD</b> indicating the minor version of the template.
     */
    dwMinorVersion : UInt32

}

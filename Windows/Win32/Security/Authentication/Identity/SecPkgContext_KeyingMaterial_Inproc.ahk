#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_KeyingMaterial_Inproc {
    #StructPack 8

    cbLabel : UInt16

    pszLabel : PSTR

    cbContextValue : UInt16

    pbContextValue : IntPtr

    cbKeyingMaterial : UInt32

    pbKeyingMaterial : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Holds target information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_target
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_Target {
    #StructPack 8

    /**
     * The length (in bytes) of the target array.
     */
    TargetLength : UInt32

    /**
     * An array containing the target information.
     */
    Target : PSTR

}

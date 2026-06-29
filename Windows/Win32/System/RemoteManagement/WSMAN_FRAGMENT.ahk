#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * WSMAN_FRAGMENT is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_fragment
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_FRAGMENT {
    #StructPack 8

    /**
     * Reserved for future use. This parameter must be <b>NULL</b>.
     */
    path : PWSTR

    /**
     * Reserved for future use. This parameter must be <b>NULL</b>.
     */
    dialect : PWSTR

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_HOLD structure is an ADSI representation of the Hold attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_hold
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_HOLD {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the name of an object put on hold.
     */
    ObjectName : PWSTR

    /**
     * Number of charges that a server places against the user on hold while it verifies the user account balance.
     */
    Amount : UInt32

}

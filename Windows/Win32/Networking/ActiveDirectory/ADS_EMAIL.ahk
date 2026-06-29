#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_EMAIL structure is an ADSI representation of the EMail Address attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_email
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_EMAIL {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the user address.
     */
    Address : PWSTR

    /**
     * Type of the email message.
     */
    Type : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_CASEIGNORE_LIST structure is an ADSI representation of the Case Ignore List attribute syntax.
 * @remarks
 * A <b>Case Ignore List</b> attribute represents an ordered sequence of case insensitive strings.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_caseignore_list
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_CASEIGNORE_LIST {
    #StructPack 8

    /**
     * Pointer to the next <b>ADS_CASEIGNORE_LIST</b> in the list of case-insensitive strings.
     */
    Next : ADS_CASEIGNORE_LIST.Ptr

    /**
     * The null-terminated Unicode string value of the current entry of the list.
     */
    String : PWSTR

}

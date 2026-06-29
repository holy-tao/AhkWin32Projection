#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used by the IResultOwnerData::FindItem method to support keyboard navigation in virtual lists in the result pane.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-resultfindinfo
 * @namespace Windows.Win32.System.Mmc
 */
export default struct RESULTFINDINFO {
    #StructPack 8

    /**
     * Null-terminated string to match.
     */
    psz : PWSTR

    /**
     * Index at which to start search.
     */
    nStart : Int32

    /**
     * One or both of the following flags:
     */
    dwOptions : UInt32

}

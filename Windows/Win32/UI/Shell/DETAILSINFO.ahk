#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "Common\STRRET.ahk" { STRRET }

/**
 * Contains detail information for a Shell folder item. Used with the SFVM_GETDETAILSOF notification.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-detailsinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DETAILSINFO {
    #StructPack 8

    /**
     * Type: <b>PCUITEMID_CHILD</b>
     * 
     * PIDL of the item whose details are being retrieved.
     */
    pidl : ITEMIDLIST.Ptr

    /**
     * Type: <b>int</b>
     */
    fmt : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of average-sized characters in the heading.
     */
    cxChar : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a> structure that includes a string containing the requested detail. To convert this structure to a string, use <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettobufa">StrRetToBuf</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettostra">StrRetToStr</a>.
     */
    str : STRRET

    /**
     * Type: <b>int</b>
     * 
     * The index of an icon in the Shell image list that is displayed in the view.
     */
    iImage : Int32

}

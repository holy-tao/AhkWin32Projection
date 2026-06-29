#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a band site. This structure is used with the IBandSite::GetBandSiteInfo and IBandSite::SetBandSiteInfo methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct BANDSITEINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The mask values that determine the other fields in this structure that are being requested or set.
     */
    dwMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Bits that specify the state of the band.
     */
    dwState : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Bit flags that specify the style of the band.
     */
    dwStyle : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains image list statistics. Used by GetStatistics.
 * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/ns-commoncontrols-imageliststats
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IMAGELISTSTATS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The image list size.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>int</b>
     * 
     * The number of images allocated.
     */
    cAlloc : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of images in use.
     */
    cUsed : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of standby images.
     */
    cStandby : Int32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about an item from a menu band.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sminfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SMINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that specify which of the other three members are valid.
     */
    dwMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A flag that indicates whether the item is a string or a separator.
     */
    dwType : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that contain information about the item and how it should be displayed.
     */
    dwFlags : UInt32

    /**
     * Type: <b>int</b>
     * 
     * When <b>SMIF_ICON</b> is set, the index of the requested icon in the toolbar image list.
     */
    iIcon : Int32

}

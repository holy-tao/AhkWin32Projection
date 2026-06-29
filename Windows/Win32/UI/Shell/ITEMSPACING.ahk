#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the dimensions of the two possible sizes of icon spacing that are available for display:\_small and large. Used by IShellFolderView::GetItemSpacing.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-itemspacing
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITEMSPACING {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * The width of the spacing between icons in small icon mode, in pixels.
     */
    cxSmall : Int32

    /**
     * Type: <b>int</b>
     * 
     * The height of the spacing between icons in small icon mode, in pixels.
     */
    cySmall : Int32

    /**
     * Type: <b>int</b>
     * 
     * The width of the spacing between icons in large icon mode, in pixels.
     */
    cxLarge : Int32

    /**
     * Type: <b>int</b>
     * 
     * The height of the spacing between icons in large icon mode, in pixels.
     */
    cyLarge : Int32

}

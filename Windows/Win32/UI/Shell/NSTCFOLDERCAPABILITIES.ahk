#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the state of a tree item. These values are used by methods of the INameSpaceTreeControlFolderCapabilities interface.
 * @remarks
 * The <b>NSTCFOLDERCAPABILITIES</b> type is defined in Shobjidl.h beginning in Windows 7.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-nstcfoldercapabilities
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NSTCFOLDERCAPABILITIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The property does not exist. Filtering is not supported.
     * @type {Integer (Int32)}
     */
    static NSTCFC_NONE => 0

    /**
     * Property exists. Supports filtering based on the value specified in <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-ispinnedtonamespacetree">System.IsPinnedToNameSpaceTree</a>.
     * @type {Integer (Int32)}
     */
    static NSTCFC_PINNEDITEMFILTERING => 1

    /**
     * Delays registration for change notifications until the tree is expanded in the navigation pane.
     * @type {Integer (Int32)}
     */
    static NSTCFC_DELAY_REGISTER_NOTIFY => 2
}

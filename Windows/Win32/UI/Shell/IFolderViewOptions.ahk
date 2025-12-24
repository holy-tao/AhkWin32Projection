#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow control of folder view options specific to the Windows 7 and later views.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided with Windows as part of CLSID_ExplorerBrowser and CLSID_ShellBrowser. Third parties do not implement this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * By default, the Windows 7 item view does not support custom positioning, custom ordering, or hyperlinks, which were supported in the Windows Vista list view. Use this interface when you require those features of the older view. If, at some later time, the item view adds support for those features, these options will automatically use the newer view rather than continuing to revert to the older view as they currently do.
 * 
 * 
 * 
 * Use this interface to turn off animation and scroll tip view options new to Windows 7.
 * 
 * Use this interface to retrieve the current view settings for all of those options.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifolderviewoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderViewOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderViewOptions
     * @type {Guid}
     */
    static IID => Guid("{3cc974d2-b302-4d36-ad3e-06d93f695d3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFolderViewOptions", "GetFolderViewOptions"]

    /**
     * Sets specified options for the view.
     * @param {Integer} fvoMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a></b>
     * 
     * A bitmask made up of one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a> flags to indicate which options' are being changed. Values in <i>fvoFlags</i> not included in this mask are ignored.
     * @param {Integer} fvoFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a></b>
     * 
     * A bitmask that contains the new values for the options specified in <i>fvoMask</i>. To enable an option, the bitmask should include the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a> flag for that option. To disable an option, the bit used for that <b>FOLDERVIEWOPTIONS</b> flag should be 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ifolderviewoptions-setfolderviewoptions
     */
    SetFolderViewOptions(fvoMask, fvoFlags) {
        result := ComCall(3, this, "int", fvoMask, "int", fvoFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the current set of options for the view.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a>*</b>
     * 
     * A bitmask that, when this method returns successfully, receives the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-folderviewoptions">FOLDERVIEWOPTIONS</a> values that are currently set.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ifolderviewoptions-getfolderviewoptions
     */
    GetFolderViewOptions() {
        result := ComCall(4, this, "int*", &pfvoFlags := 0, "HRESULT")
        return pfvoFlags
    }
}

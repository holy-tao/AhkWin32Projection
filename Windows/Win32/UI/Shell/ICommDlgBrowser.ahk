#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by the common file dialog boxes to be used when they host a Shell browser.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  In Windows XP and earlier, this interface was defined in Shlobj.h.
 *       </div>
 * <div> </div>
 * This interface is implemented only by the common file dialog boxes.
 * 
 * Use <b>ICommDlgBrowser</b> when you need to provide special behavior while hosted inside the common dialog boxes.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icommdlgbrowser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICommDlgBrowser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommDlgBrowser
     * @type {Guid}
     */
    static IID => Guid("{000214f1-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDefaultCommand", "OnStateChange", "IncludeObject"]

    /**
     * Called when a user double-clicks in the view or presses the ENTER key.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the view's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icommdlgbrowser-ondefaultcommand
     */
    OnDefaultCommand(ppshv) {
        result := ComCall(3, this, "ptr", ppshv, "HRESULT")
        return result
    }

    /**
     * Called after a state, identified by the uChange parameter, has changed in the IShellView interface.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the view's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface.
     * @param {Integer} uChange Type: <b>ULONG</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icommdlgbrowser-onstatechange
     */
    OnStateChange(ppshv, uChange) {
        result := ComCall(4, this, "ptr", ppshv, "uint", uChange, "HRESULT")
        return result
    }

    /**
     * Allows the common dialog box to filter objects that the view displays.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the view's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A PIDL, relative to the folder, that identifies the object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The browser should return S_OK to include the object in the view, or S_FALSE to hide it.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icommdlgbrowser-includeobject
     */
    IncludeObject(ppshv, pidl) {
        result := ComCall(5, this, "ptr", ppshv, "ptr", pidl, "HRESULT")
        return result
    }
}

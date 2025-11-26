#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellView.ahk

/**
 * Extends the capabilities of IShellView.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IShellView2</b> if your namespace extension provides services to clients beyond those in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You do not call this interface directly. <b>IShellView2</b> is used by the operating system only when it has confirmed that your application is aware of this interface. Objects that expose <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> and <b>IShellView2</b> are usually created by other Shell folder objects.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellview2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellView2 extends IShellView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellView2
     * @type {Guid}
     */
    static IID => Guid("{88e39e80-3578-11cf-ae69-08002b2e1262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetView", "CreateViewWindow2", "HandleRename", "SelectAndPositionItem"]

    /**
     * Requests the current or default Shell view, together with all other valid view identifiers (VIDs) supported by this implementation of IShellView2.
     * @param {Pointer<Guid>} pvid Type: <b>SHELLVIEWID*</b>
     * 
     * A pointer to the GUID of the requested view. The following views are defined in Shlguid.h.
     * @param {Integer} uView Type: <b>ULONG</b>
     * 
     * The type of view requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a standard COM error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview2-getview
     */
    GetView(pvid, uView) {
        result := ComCall(16, this, "ptr", pvid, "uint", uView, "HRESULT")
        return result
    }

    /**
     * Used to request the creation of a new Shell view window. It can be either the right pane of Windows Explorer or the client window of a folder window.
     * @param {Pointer<SV2CVW2_PARAMS>} lpParams Type: <b>LPSV2CVW2_PARAMS</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sv2cvw2_params">SV2CVW2_PARAMS</a> structure that defines the new view window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a success code if successful, or a COM error code otherwise. Use the <a href="/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros to determine whether the operation succeeded or failed.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview2-createviewwindow2
     */
    CreateViewWindow2(lpParams) {
        result := ComCall(17, this, "ptr", lpParams, "HRESULT")
        return result
    }

    /**
     * Used to change an item's identifier.
     * @param {Pointer<ITEMIDLIST>} pidlNew Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure. The current identifier is passed in and is replaced by the new one.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Return S_OK if successful, or a COM-defined error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview2-handlerename
     */
    HandleRename(pidlNew) {
        result := ComCall(18, this, "ptr", pidlNew, "HRESULT")
        return result
    }

    /**
     * Selects and positions an item in a Shell View.
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that uniquely identifies the item of interest.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif">_SVSIF</a> constants that specify the type of selection to apply.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure containing the new position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellview2-selectandpositionitem
     */
    SelectAndPositionItem(pidlItem, uFlags, ppt) {
        result := ComCall(19, this, "ptr", pidlItem, "uint", uFlags, "ptr", ppt, "HRESULT")
        return result
    }
}

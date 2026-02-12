#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by the common file dialog boxes to be used when they host a Shell browser.
 * @remarks
 * <div class="alert"><b>Note</b>  In Windows XP and earlier, this interface was defined in Shlobj.h.
 *       </div>
 * <div> </div>
 * This interface is implemented only by the common file dialog boxes.
 * 
 * Use <b>ICommDlgBrowser</b> when you need to provide special behavior while hosted inside the common dialog boxes.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-icommdlgbrowser
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
     * @remarks
     * The browser should return S_OK if it has processed the action or S_FALSE to let the view perform the default action.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * This method allows the default command to be handled by the common dialog box instead of the view.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the view's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-ondefaultcommand
     */
    OnDefaultCommand(ppshv) {
        result := ComCall(3, this, "ptr", ppshv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called after a state, identified by the uChange parameter, has changed in the IShellView interface.
     * @remarks
     * This method is used to let the common file dialog boxes track the state of the view and change its user interface as needed.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * When items in the view are selected, or when the view loses the focus, it needs to call this method to notify the common dialog that either the view state or selection state is changing.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the view's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface.
     * @param {Integer} uChange Type: <b>ULONG</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-onstatechange
     */
    OnStateChange(ppshv, uChange) {
        result := ComCall(4, this, "ptr", ppshv, "uint", uChange, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allows the common dialog box to filter objects that the view displays.
     * @remarks
     * This method is called by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a> implementation when hosted in file dialog boxes. The enumerator calls this method to let the common dialog box filter out objects that should not be displayed. Typically, the file dialog boxes will get the display text of the item, and filter by the extension.
     * 
     * <h3><a id="Note_to_Calling_Applications"></a><a id="note_to_calling_applications"></a><a id="NOTE_TO_CALLING_APPLICATIONS"></a>Note to Calling Applications</h3>
     * Call this method before returning an object in the Shell folder's IDLIST enumerator.
     * 
     * When dealing with data sources that have many items, such as libraries and searches, the callback to this method results in poor performance. To avoid that situation, implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser2-getviewflags">GetViewFlags</a> and return CDB2GVF_NOINCLUDEITEM. Doing so enables the view to skip calling <b>ICommDlgBrowser::IncludeObject</b>, thereby improving performance.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the view's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A PIDL, relative to the folder, that identifies the object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The browser should return S_OK to include the object in the view, or S_FALSE to hide it.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-includeobject
     */
    IncludeObject(ppshv, pidl) {
        result := ComCall(5, this, "ptr", ppshv, "ptr", pidl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

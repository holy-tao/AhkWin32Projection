#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get or set selected items represented by a Shell item array.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * This interface is implemented by verbs that implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexecutecommand">IExecuteCommand</a>. This allows objects to invoke the verb on the selection through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexecutecommand-execute">IExecuteCommand::Execute</a>.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * <b>IObjectWithSelection</b> is used by Windows Explorer to invoke a verb on the selected items. Do not call this interface directly.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectwithselection
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithSelection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithSelection
     * @type {Guid}
     */
    static IID => Guid("{1c9cd5bb-98e9-4491-a60f-31aacc72b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSelection", "GetSelection"]

    /**
     * 
     * @param {IShellItemArray} psia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithselection-setselection
     */
    SetSelection(psia) {
        result := ComCall(3, this, "ptr", psia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithselection-getselection
     */
    GetSelection(riid, ppv) {
        result := ComCall(4, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}

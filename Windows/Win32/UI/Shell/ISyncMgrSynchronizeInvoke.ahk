#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable a registered application to invoke the synchronization manager to update items.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface is implemented by the synchronization manager.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * A registered application calls the methods of this interface to update all items or to update specific items.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mobsync/nn-mobsync-isyncmgrsynchronizeinvoke
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSynchronizeInvoke extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrSynchronizeInvoke
     * @type {Guid}
     */
    static IID => Guid("{6295df2c-35ee-11d1-8707-00c04fd93327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateItems", "UpdateAll"]

    /**
     * Programmatically starts an update for specified items.
     * @param {Integer} dwInvokeFlags Type: <b>DWORD</b>
     * 
     * Specifies how an item should be invoked using the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrinvokeflags">SYNCMGRINVOKEFLAGS</a> enumeration values.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * The CLSID of a registered application to be invoked for an update.
     * @param {Integer} cbCookie Type: <b>DWORD</b>
     * 
     * The size of <i>pCookie</i> data, in bytes.
     * @param {Pointer<Integer>} pCookie Type: <b>const BYTE*</b>
     * 
     * A pointer to a private token that identifies an application. The token is passed in the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-initialize">Initialize</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED and E_OUTOFMEMORY, and the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The synchronization is successfully updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The errors occur during a synchronization update.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizeinvoke-updateitems
     */
    UpdateItems(dwInvokeFlags, clsid, cbCookie, pCookie) {
        pCookieMarshal := pCookie is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwInvokeFlags, "ptr", clsid, "uint", cbCookie, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * Programmatically starts an update for all items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call was completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizeinvoke-updateall
     */
    UpdateAll() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}

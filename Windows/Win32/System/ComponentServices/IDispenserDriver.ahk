#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Is called by the holder of the COM+ Resource Dispenser to create, enlist, evaluate, prepare, and destroy a resource.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-idispenserdriver
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IDispenserDriver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispenserDriver
     * @type {Guid}
     */
    static IID => Guid("{208b3651-2b48-11cf-be10-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResource", "RateResource", "EnlistResource", "ResetResource", "DestroyResource", "DestroyResourceS"]

    /**
     * Creates a resource.
     * @param {Pointer} ResTypId The type of resource to be created.
     * @param {Pointer<Pointer>} pResId A handle to the newly created resource.
     * @param {Pointer<Integer>} pSecsFreeBeforeDestroy The time-out of the new resource. This is the number of seconds that this resource is allowed to remain idle in the pool before it is destroyed.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-idispenserdriver-createresource
     */
    CreateResource(ResTypId, pResId, pSecsFreeBeforeDestroy) {
        pResIdMarshal := pResId is VarRef ? "ptr*" : "ptr"
        pSecsFreeBeforeDestroyMarshal := pSecsFreeBeforeDestroy is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", ResTypId, pResIdMarshal, pResId, pSecsFreeBeforeDestroyMarshal, pSecsFreeBeforeDestroy, "HRESULT")
        return result
    }

    /**
     * Evaluates how well a candidate resource matches.
     * @param {Pointer} ResTypId The type of resource that the Dispenser Manager is looking to match.
     * @param {Pointer} ResId The candidate resource that the Dispenser Manager is considering.
     * @param {BOOL} fRequiresTransactionEnlistment If <b>TRUE</b>, the candidate resource (<i>ResId</i>), if chosen, requires transaction enlistment. If enlistment is expensive, <b>RateResource</b> might rate such a resource lower than a resource that is already enlisted in the correct transaction.
     * @param {Pointer<Integer>} pRating 
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-idispenserdriver-rateresource
     */
    RateResource(ResTypId, ResId, fRequiresTransactionEnlistment, pRating) {
        pRatingMarshal := pRating is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", ResTypId, "ptr", ResId, "int", fRequiresTransactionEnlistment, pRatingMarshal, pRating, "HRESULT")
        return result
    }

    /**
     * Enlists a resource in a transaction.
     * @param {Pointer} ResId The resource that the Dispenser Manager is asking to be enlisted in transaction <i>TransId</i>.
     * @param {Pointer} TransId The transaction that the Dispenser Manager wants the Resource Dispenser to enlist resource <i>ResId</i> in. The Dispenser Manager passes 0 to indicate that the Resource Dispenser should ensure that the resource is not enlisted in any transaction.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not enlistable (not transaction capable).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not valid.
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
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-idispenserdriver-enlistresource
     */
    EnlistResource(ResId, TransId) {
        result := ComCall(5, this, "ptr", ResId, "ptr", TransId, "HRESULT")
        return result
    }

    /**
     * Prepares the resource to be put back into general or enlisted inventory.
     * @param {Pointer} ResId The resource to be reset.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ResId</i> is not a valid resource handle.
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
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-idispenserdriver-resetresource
     */
    ResetResource(ResId) {
        result := ComCall(6, this, "ptr", ResId, "HRESULT")
        return result
    }

    /**
     * Destroys a resource.
     * @param {Pointer} ResId The resource that the Dispenser Manager is asking the Resource Dispenser to destroy.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Resource Dispenser does not support numeric RESIDs.
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
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-idispenserdriver-destroyresource
     */
    DestroyResource(ResId) {
        result := ComCall(7, this, "ptr", ResId, "HRESULT")
        return result
    }

    /**
     * Destroys a resource (string resource version).
     * @param {Pointer<Integer>} ResId The resource that the Dispenser Manager is asking the Resource Dispenser to destroy.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Resource Dispenser does not support numeric SRESIDs.
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
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-idispenserdriver-destroyresources
     */
    DestroyResourceS(ResId) {
        ResIdMarshal := ResId is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, ResIdMarshal, ResId, "HRESULT")
        return result
    }
}

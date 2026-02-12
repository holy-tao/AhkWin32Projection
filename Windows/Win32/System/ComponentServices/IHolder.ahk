#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allocates or frees resources for an installed Resource Dispenser.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-iholder
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IHolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolder
     * @type {Guid}
     */
    static IID => Guid("{bf6a1850-2b45-11cf-be10-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocResource", "FreeResource", "TrackResource", "TrackResourceS", "UntrackResource", "UntrackResourceS", "Close", "RequestDestroyResource"]

    /**
     * Allocates a resource from the inventory.
     * @remarks
     * The Dispenser Manager takes the following steps to locate a resource:
     * 
     * <ol>
     * <li>Searches the pool for a free resource of this RESTYPID, which is already enlisted in the caller's current transaction.</li>
     * <li>Searches the pool for a free unenlisted resource of this RESTYPID, and then enlists it in the caller's current transaction.</li>
     * <li>Creates the resource by calling back to the Resource Dispenser's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-createresource">IDispenserDriver::CreateResource</a> method, and then enlists it.</li>
     * </ol>
     * If the caller does not have a current transaction, the enlistment is skipped. Or if the Resource Dispenser rejects the enlistment (meaning the resource is not transaction capable), the enlistment is skipped.
     * @param {Pointer} __MIDL__IHolder0000 The type of resource to be allocated.
     * @param {Pointer<Pointer>} __MIDL__IHolder0001 A pointer to the location where the handle of the allocated resource is returned.
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
     * <i>ResTypId</i> is <b>NULL</b> or an empty string, or the Resource Dispenser's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-createresource">IDispenserDriver::CreateResource</a> method generated an empty or duplicate RESID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. The <i>pResId</i> parameter has not been set. The likely cause is that the caller's transaction is aborting.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-allocresource
     */
    AllocResource(__MIDL__IHolder0000, __MIDL__IHolder0001) {
        __MIDL__IHolder0001Marshal := __MIDL__IHolder0001 is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", __MIDL__IHolder0000, __MIDL__IHolder0001Marshal, __MIDL__IHolder0001, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a resource to the inventory.
     * @remarks
     * A resource originally returned by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iholder-allocresource">IHolder::AllocResource</a> is returned to the pool. This notifies the Resource Dispenser through <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-resetresource">IDispenserDriver::ResetResource</a>, which is the Resource Dispenser's opportunity to prepare the resource before it is returned to the pool.
     * @param {Pointer} __MIDL__IHolder0002 The handle of the resource to be freed.
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
     * <i>ResTypId</i> is not a valid resource handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. The resource has not been freed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-freeresource
     */
    FreeResource(__MIDL__IHolder0002) {
        result := ComCall(4, this, "ptr", __MIDL__IHolder0002, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Tracks the resource.
     * @remarks
     * Some resources are not kept in inventory; they are always manufactured on demand. The Holder is used only as a mechanism to automatically free the resources left at the end of an object's lifetime.
     * 
     * TrackResource tells the Holder that a resource should be tracked until it is freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iholder-untrackresource">IHolder::UntrackResource</a>, or until the object that called <b>TrackResource</b> is released, at which time the Dispenser Manager automatically frees the resource.
     * 
     * If <b>TrackResource</b> is called from a transactional object, it calls back to the Resource Dispenser's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-enlistresource">IDispenserDriver::EnlistResource</a> method. The <b>EnlistResource</b> method can enlist the resource in the transaction, or it can return S_FALSE, indicating that the resource is not transaction capable and has not been enlisted.
     * 
     * This resource is eventually destroyed after both of the following are true: 
     * 
     * 
     * 
     * <ul>
     * <li>The Resource Dispenser calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iholder-untrackresource">IHolder::UntrackResource</a> (most likely at the component's request), or the object's lifetime ends.</li>
     * <li>The transaction that the resource was enlisted in (if any) is done.</li>
     * </ul>
     * @param {Pointer} __MIDL__IHolder0003 The handle of the resource to be tracked. The Resource Dispenser has already created this resource before calling <b>TrackResource</b>.
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
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. The resource has not been tracked. The likely cause is that the caller's transaction is aborting.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-trackresource
     */
    TrackResource(__MIDL__IHolder0003) {
        result := ComCall(5, this, "ptr", __MIDL__IHolder0003, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Tracks the resource (string version).
     * @param {Pointer<Integer>} __MIDL__IHolder0004 The handle of the resource to be tracked. The Resource Dispenser has already created this resource before calling <b>TrackResourceS</b>.
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
     * <i>SResId</i> is not a valid resource handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. The resource has not been tracked. The likely cause is that the caller's transaction is aborting.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-trackresources
     */
    TrackResourceS(__MIDL__IHolder0004) {
        __MIDL__IHolder0004Marshal := __MIDL__IHolder0004 is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, __MIDL__IHolder0004Marshal, __MIDL__IHolder0004, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops tracking a resource.
     * @param {Pointer} __MIDL__IHolder0005 The handle of the resource to stop tracking.
     * @param {BOOL} __MIDL__IHolder0006 If <b>TRUE</b>, caller is requesting that the resource be destroyed, by calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresource">IDispenserDriver::DestroyResource</a>. If <b>FALSE</b>, caller destroys the resource.
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
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-untrackresource
     */
    UntrackResource(__MIDL__IHolder0005, __MIDL__IHolder0006) {
        result := ComCall(7, this, "ptr", __MIDL__IHolder0005, "int", __MIDL__IHolder0006, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops tracking a resource (string version).
     * @param {Pointer<Integer>} __MIDL__IHolder0007 The handle of the resource to stop tracking.
     * @param {BOOL} __MIDL__IHolder0008 If <b>TRUE</b>, caller is requesting that the resource be destroyed, by calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresource">IDispenserDriver::DestroyResource</a>. If <b>FALSE</b>, caller destroys the resource.
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
     * <i>SResId</i> is not a valid resource handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-untrackresources
     */
    UntrackResourceS(__MIDL__IHolder0007, __MIDL__IHolder0008) {
        __MIDL__IHolder0007Marshal := __MIDL__IHolder0007 is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, __MIDL__IHolder0007Marshal, __MIDL__IHolder0007, "int", __MIDL__IHolder0008, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the Holder.
     * @remarks
     * This closes a Resource Dispenser's Holder, after which the Resource Dispenser probably released.
     * 
     * Before closing, any remaining inventory is destroyed by calling back to the Resource Dispenser's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresource">IDispenserDriver::DestroyResource</a> method.
     * 
     * 
     * 
     * The following sequence describes how to close down a Resource Dispenser:
     * 
     * <ol>
     * <li>Obtain a reference to the Resource Dispenser (the object that exposes <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-idispenserdriver">IDispenserDriver</a>).
     * </li>
     * <li>Call a method in Resource Dispenser whose implementation calls <b>IHolder::Close</b>.
     * </li>
     * <li><b>IHolder::Close</b> destroys any remaining inventory by calling back to Resource Dispenser's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresource">IDispenserDriver::DestroyResource</a> method.
     * </li>
     * <li><b>IHolder::Close</b> calls the Dispenser Manager to remove this Holder from the Holder list. (If no Holders remain, the Dispenser Manager object deletes itself.)
     * </li>
     * <li><b>IHolder::Close</b> releases its reference to Resource Dispenser's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-idispenserdriver">IDispenserDriver</a> interface. This is the reason you need a reference in step 1; otherwise, the Resource Dispenser would delete itself prematurely before the subsequent steps can be completed.
     * </li>
     * <li><b>IHolder::Close</b> returns to the Resource Dispenser.
     * </li>
     * <li>The Resource Dispenser calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-destroyresource">IDispenserDriver::DestroyResource</a>. The Holder now deletes itself.
     * </li>
     * <li>The method called in step 2 now returns.
     * </li>
     * <li>Release your final reference to the Resource Dispenser, which now deletes itself.
     * </li>
     * </ol>
     * Note that the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-idispensermanager-registerdispenser">IDispenserManager::RegisterDispenser</a> method does not call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on its <i>pDispenserDriver</i> object, but <b>IHolder::Close</b> does perform a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on <i>pDispenserDriver</i>. This can cause the Resource Dispenser object to be destroyed prematurely. To prevent this premature destruction, the caller of <b>IHolder::Close</b> must hold a reference to the Resource Dispenser object as described in steps 1 and 5.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-close
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes a resource, calling its destructor to free memory and other associated system resources.
     * @param {Pointer} __MIDL__IHolder0009 The resource to be destroyed.
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
     * <dt><b>E_FAIL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed. The resource has not been destroyed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iholder-requestdestroyresource
     */
    RequestDestroyResource(__MIDL__IHolder0009) {
        result := ComCall(10, this, "ptr", __MIDL__IHolder0009, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

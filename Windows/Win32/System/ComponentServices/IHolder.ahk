#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allocates or frees resources for an installed Resource Dispenser.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iholder
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
     * <i>ResTypId</i> is <b>NULL</b> or an empty string, or the Resource Dispenser's <a href="/windows/desktop/api/comsvcs/nf-comsvcs-idispenserdriver-createresource">IDispenserDriver::CreateResource</a> method generated an empty or duplicate RESID.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-allocresource
     */
    AllocResource(__MIDL__IHolder0000, __MIDL__IHolder0001) {
        __MIDL__IHolder0001Marshal := __MIDL__IHolder0001 is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", __MIDL__IHolder0000, __MIDL__IHolder0001Marshal, __MIDL__IHolder0001, "HRESULT")
        return result
    }

    /**
     * Returns a resource to the inventory.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-freeresource
     */
    FreeResource(__MIDL__IHolder0002) {
        result := ComCall(4, this, "ptr", __MIDL__IHolder0002, "HRESULT")
        return result
    }

    /**
     * Tracks the resource.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-trackresource
     */
    TrackResource(__MIDL__IHolder0003) {
        result := ComCall(5, this, "ptr", __MIDL__IHolder0003, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-trackresources
     */
    TrackResourceS(__MIDL__IHolder0004) {
        __MIDL__IHolder0004Marshal := __MIDL__IHolder0004 is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, __MIDL__IHolder0004Marshal, __MIDL__IHolder0004, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-untrackresource
     */
    UntrackResource(__MIDL__IHolder0005, __MIDL__IHolder0006) {
        result := ComCall(7, this, "ptr", __MIDL__IHolder0005, "int", __MIDL__IHolder0006, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-untrackresources
     */
    UntrackResourceS(__MIDL__IHolder0007, __MIDL__IHolder0008) {
        __MIDL__IHolder0007Marshal := __MIDL__IHolder0007 is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, __MIDL__IHolder0007Marshal, __MIDL__IHolder0007, "int", __MIDL__IHolder0008, "HRESULT")
        return result
    }

    /**
     * Closes the Holder.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iholder-requestdestroyresource
     */
    RequestDestroyResource(__MIDL__IHolder0009) {
        result := ComCall(10, this, "ptr", __MIDL__IHolder0009, "HRESULT")
        return result
    }
}

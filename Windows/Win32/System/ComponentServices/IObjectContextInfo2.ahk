#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IObjectContextInfo.ahk

/**
 * Provides additional information about an object's context. This interface extends the IObjectContextInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontextinfo2
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContextInfo2 extends IObjectContextInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectContextInfo2
     * @type {Guid}
     */
    static IID => Guid("{594be71a-4bc4-438b-9197-cfd176248b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartitionId", "GetApplicationId", "GetApplicationInstanceId"]

    /**
     * Retrieves the identifier of the partition of the current object context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the COM+ partition.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * <dt><b>COMADMIN_E_PARTITIONS_DISABLED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM+ partitions are not enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo2-getpartitionid
     */
    GetPartitionId(pGuid) {
        result := ComCall(8, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the application of the current object context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the application.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo2-getapplicationid
     */
    GetApplicationId(pGuid) {
        result := ComCall(9, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the application instance of the current object context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the application instance.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo2-getapplicationinstanceid
     */
    GetApplicationInstanceId(pGuid) {
        result := ComCall(10, this, "ptr", pGuid, "HRESULT")
        return result
    }
}

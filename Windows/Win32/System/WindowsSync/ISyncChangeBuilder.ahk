#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides additional data for an item change.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebuilder
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBuilder
     * @type {Guid}
     */
    static IID => Guid("{56f14771-8677-484f-a170-e386e418a676}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddChangeUnitMetadata"]

    /**
     * Adds change unit metadata to an item change.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to add to the item change.
     * @param {Pointer<SYNC_VERSION>} pChangeUnitVersion The version of the change unit change to add to the item change.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the change unit ID that is contained in <i>pbChangeUnitId</i> does not match the format that is specified by the ID format schema of the provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item change to which to add this change unit to has <b>SYNC_CHANGE_FLAG_DELETE</b> or <b>SYNC_CHANGE_FLAG_DOES_NOT_EXIST</b> set as one of its flags.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebuilder-addchangeunitmetadata
     */
    AddChangeUnitMetadata(pbChangeUnitId, pChangeUnitVersion) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr", pChangeUnitVersion, "HRESULT")
        return result
    }
}

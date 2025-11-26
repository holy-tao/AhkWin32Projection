#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncKnowledge.ahk

/**
 * Represents knowledge that has been forgotten because of tombstone cleanup.
 * @remarks
 * 
 * The forgotten knowledge tracks the maximum version of tombstones that have been cleaned up. When an item is deleted from the item store, the metadata for that item is kept, but the item is marked as deleted. Metadata for a deleted item is called a tombstone. Tombstones must be periodically cleaned up or they will eventually use too much space in the item store. When a tombstone is removed from the metadata, the forgotten knowledge must be updated to contain the version of the removed tombstone. Be aware that forgotten knowledge is an overestimation of which items have had their metadata removed. Therefore, the forgotten knowledge might also contain items that still have active entries in the metadata.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iforgottenknowledge
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IForgottenKnowledge extends ISyncKnowledge{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IForgottenKnowledge
     * @type {Guid}
     */
    static IID => Guid("{456e0f96-6036-452b-9f9d-bcc4b4a85db2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ForgetToVersion"]

    /**
     * Updates the forgotten knowledge to reflect that all versions that are less than or equal to the specified version might have been forgotten, and that corresponding tombstones might have been deleted.
     * @param {ISyncKnowledge} pKnowledge The current knowledge of the replica that owns this forgotten knowledge object.
     * @param {Pointer<SYNC_VERSION>} pVersion The version of the tombstone that has been cleaned up.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iforgottenknowledge-forgettoversion
     */
    ForgetToVersion(pKnowledge, pVersion) {
        result := ComCall(27, this, "ptr", pKnowledge, "ptr", pVersion, "HRESULT")
        return result
    }
}

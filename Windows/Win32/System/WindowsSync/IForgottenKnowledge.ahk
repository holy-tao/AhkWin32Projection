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
     * 
     * @param {ISyncKnowledge} pKnowledge 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iforgottenknowledge-forgettoversion
     */
    ForgetToVersion(pKnowledge, pVersion) {
        result := ComCall(27, this, "ptr", pKnowledge, "ptr", pVersion, "HRESULT")
        return result
    }
}

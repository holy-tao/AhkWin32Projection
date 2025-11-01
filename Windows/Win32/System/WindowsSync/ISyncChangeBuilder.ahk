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
     * 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @param {Pointer<SYNC_VERSION>} pChangeUnitVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebuilder-addchangeunitmetadata
     */
    AddChangeUnitMetadata(pbChangeUnitId, pChangeUnitVersion) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr", pChangeUnitVersion, "HRESULT")
        return result
    }
}

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
     * 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<SYNC_VERSION>} pChangeUnitVersion 
     * @returns {HRESULT} 
     */
    AddChangeUnitMetadata(pbChangeUnitId, pChangeUnitVersion) {
        result := ComCall(3, this, "char*", pbChangeUnitId, "ptr", pChangeUnitVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

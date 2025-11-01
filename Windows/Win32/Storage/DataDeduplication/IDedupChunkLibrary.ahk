#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupChunkLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDedupChunkLibrary
     * @type {Guid}
     */
    static IID => Guid("{bb5144d7-2720-4dcc-8777-78597416ec23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeForPushBuffers", "Uninitialize", "SetParameter", "StartChunking"]

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeForPushBuffers() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Uninitialize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParamType 
     * @param {VARIANT} vParamValue 
     * @returns {HRESULT} 
     */
    SetParameter(dwParamType, vParamValue) {
        result := ComCall(5, this, "uint", dwParamType, "ptr", vParamValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} iidIteratorInterfaceID 
     * @param {Pointer<IUnknown>} ppChunksEnum 
     * @returns {HRESULT} 
     */
    StartChunking(iidIteratorInterfaceID, ppChunksEnum) {
        result := ComCall(6, this, "ptr", iidIteratorInterfaceID, "ptr*", ppChunksEnum, "HRESULT")
        return result
    }
}

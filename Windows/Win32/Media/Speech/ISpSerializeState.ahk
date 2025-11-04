#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSerializeState extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSerializeState
     * @type {Guid}
     */
    static IID => Guid("{21b501a0-0ec7-46c9-92c3-a2bc784c54b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSerializedState", "SetSerializedState"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pulSize 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSerializedState(ppbData, pulSize, dwReserved) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pulSizeMarshal := pulSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppbDataMarshal, ppbData, pulSizeMarshal, pulSize, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} ulSize 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetSerializedState(pbData, ulSize, dwReserved) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbDataMarshal, pbData, "uint", ulSize, "uint", dwReserved, "HRESULT")
        return result
    }
}

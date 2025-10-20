#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSerializeState extends IUnknown{
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
     * 
     * @param {Pointer<Byte>} ppbData 
     * @param {Pointer<UInt32>} pulSize 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSerializedState(ppbData, pulSize, dwReserved) {
        result := ComCall(3, this, "char*", ppbData, "uint*", pulSize, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbData 
     * @param {Integer} ulSize 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetSerializedState(pbData, ulSize, dwReserved) {
        result := ComCall(4, this, "char*", pbData, "uint", ulSize, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

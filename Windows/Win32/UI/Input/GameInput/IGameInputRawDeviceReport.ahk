#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputRawDeviceReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputRawDeviceReport
     * @type {Guid}
     */
    static IID => Guid("{61f08cf1-1ffc-40ca-a2b8-e1ab8bc5b6dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetReportInfo", "GetRawDataSize", "GetRawData", "SetRawData", "GetItemValue", "SetItemValue", "ResetItemValue", "ResetAllItems"]

    /**
     * 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDevice(device) {
        ComCall(3, this, "ptr*", device)
    }

    /**
     * 
     * @returns {Pointer<GameInputRawDeviceReportInfo>} 
     */
    GetReportInfo() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetRawDataSize() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} bufferSize 
     * @param {Pointer<Void>} buffer 
     * @returns {Pointer} 
     */
    GetRawData(bufferSize, buffer) {
        bufferMarshal := buffer is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", bufferSize, bufferMarshal, buffer, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} bufferSize 
     * @param {Pointer<Void>} buffer 
     * @returns {Boolean} 
     */
    SetRawData(bufferSize, buffer) {
        bufferMarshal := buffer is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", bufferSize, bufferMarshal, buffer, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @param {Pointer<Integer>} value 
     * @returns {Boolean} 
     */
    GetItemValue(itemIndex, value) {
        valueMarshal := value is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "uint", itemIndex, valueMarshal, value, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    SetItemValue(itemIndex, value) {
        result := ComCall(9, this, "uint", itemIndex, "int64", value, "int")
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @returns {Boolean} 
     */
    ResetItemValue(itemIndex) {
        result := ComCall(10, this, "uint", itemIndex, "int")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    ResetAllItems() {
        result := ComCall(11, this, "int")
        return result
    }
}

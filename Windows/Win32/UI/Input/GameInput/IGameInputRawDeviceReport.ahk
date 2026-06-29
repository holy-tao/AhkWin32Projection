#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGameInputDevice.ahk" { IGameInputDevice }
#Import ".\GameInputRawDeviceReportInfo.ahk" { GameInputRawDeviceReportInfo }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct IGameInputRawDeviceReport extends IUnknown {
    /**
     * The interface identifier for IGameInputRawDeviceReport
     * @type {Guid}
     */
    static IID := Guid("{61f08cf1-1ffc-40ca-a2b8-e1ab8bc5b6dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameInputRawDeviceReport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice      : IntPtr
        GetReportInfo  : IntPtr
        GetRawDataSize : IntPtr
        GetRawData     : IntPtr
        SetRawData     : IntPtr
        GetItemValue   : IntPtr
        SetItemValue   : IntPtr
        ResetItemValue : IntPtr
        ResetAllItems  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameInputRawDeviceReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDevice(device) {
        ComCall(3, this, IGameInputDevice.Ptr, device)
    }

    /**
     * 
     * @returns {Pointer<GameInputRawDeviceReportInfo>} 
     */
    GetReportInfo() {
        result := ComCall(4, this, GameInputRawDeviceReportInfo.Ptr)
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetRawDataSize() {
        result := ComCall(5, this, IntPtr)
        return result
    }

    /**
     * 
     * @param {Pointer} bufferSize 
     * @param {Pointer<Void>} _buffer 
     * @returns {Pointer} 
     */
    GetRawData(bufferSize, _buffer) {
        _bufferMarshal := _buffer is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", bufferSize, _bufferMarshal, _buffer, IntPtr)
        return result
    }

    /**
     * 
     * @param {Pointer} bufferSize 
     * @param {Pointer<Void>} _buffer 
     * @returns {Boolean} 
     */
    SetRawData(bufferSize, _buffer) {
        _bufferMarshal := _buffer is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", bufferSize, _bufferMarshal, _buffer, Int32)
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

        result := ComCall(8, this, "uint", itemIndex, valueMarshal, value, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    SetItemValue(itemIndex, value) {
        result := ComCall(9, this, "uint", itemIndex, "int64", value, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} itemIndex 
     * @returns {Boolean} 
     */
    ResetItemValue(itemIndex) {
        result := ComCall(10, this, "uint", itemIndex, Int32)
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    ResetAllItems() {
        result := ComCall(11, this, Int32)
        return result
    }

    Query(iid) {
        if (IGameInputRawDeviceReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.GetReportInfo := CallbackCreate(GetMethod(implObj, "GetReportInfo"), flags, 1)
        this.vtbl.GetRawDataSize := CallbackCreate(GetMethod(implObj, "GetRawDataSize"), flags, 1)
        this.vtbl.GetRawData := CallbackCreate(GetMethod(implObj, "GetRawData"), flags, 3)
        this.vtbl.SetRawData := CallbackCreate(GetMethod(implObj, "SetRawData"), flags, 3)
        this.vtbl.GetItemValue := CallbackCreate(GetMethod(implObj, "GetItemValue"), flags, 3)
        this.vtbl.SetItemValue := CallbackCreate(GetMethod(implObj, "SetItemValue"), flags, 3)
        this.vtbl.ResetItemValue := CallbackCreate(GetMethod(implObj, "ResetItemValue"), flags, 2)
        this.vtbl.ResetAllItems := CallbackCreate(GetMethod(implObj, "ResetAllItems"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.GetReportInfo)
        CallbackFree(this.vtbl.GetRawDataSize)
        CallbackFree(this.vtbl.GetRawData)
        CallbackFree(this.vtbl.SetRawData)
        CallbackFree(this.vtbl.GetItemValue)
        CallbackFree(this.vtbl.SetItemValue)
        CallbackFree(this.vtbl.ResetItemValue)
        CallbackFree(this.vtbl.ResetAllItems)
    }
}

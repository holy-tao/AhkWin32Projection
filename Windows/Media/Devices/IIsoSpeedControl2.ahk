#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IIsoSpeedControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsoSpeedControl2
     * @type {Guid}
     */
    static IID => Guid("{6f1578f2-6d77-4f8a-8c2f-6130b6395053}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Min", "get_Max", "get_Step", "get_Value", "SetValueAsync", "get_Auto", "SetAutoAsync"]

    /**
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} isoSpeed 
     * @returns {IAsyncAction} 
     */
    SetValueAsync(isoSpeed) {
        result := ComCall(10, this, "uint", isoSpeed, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Auto() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SetAutoAsync() {
        result := ComCall(12, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IWhiteBalanceControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWhiteBalanceControl
     * @type {Guid}
     */
    static IID => Guid("{781f047e-7162-49c8-a8f9-9481c565363e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_Preset", "SetPresetAsync", "get_Min", "get_Max", "get_Step", "get_Value", "SetValueAsync"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Integer} 
     */
    Preset {
        get => this.get_Preset()
    }

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
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Preset() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} preset 
     * @returns {IAsyncAction} 
     */
    SetPresetAsync(preset) {
        result := ComCall(8, this, "int", preset, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
        result := ComCall(10, this, "uint*", &value := 0, "int")
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
        result := ComCall(11, this, "uint*", &value := 0, "int")
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
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} temperature 
     * @returns {IAsyncAction} 
     */
    SetValueAsync(temperature) {
        result := ComCall(13, this, "uint", temperature, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}

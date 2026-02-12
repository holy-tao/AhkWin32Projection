#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IExposureControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExposureControl
     * @type {Guid}
     */
    static IID => Guid("{09e8cbe2-ad96-4f28-a0e0-96ed7e1b5fd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_Auto", "SetAutoAsync", "get_Min", "get_Max", "get_Step", "get_Value", "SetValueAsync"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
    }

    /**
     * @type {TimeSpan} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * @type {TimeSpan} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * @type {TimeSpan} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * @type {TimeSpan} 
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
     * @returns {Boolean} 
     */
    get_Auto() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {IAsyncAction} 
     */
    SetAutoAsync(value) {
        result := ComCall(8, this, "int", value, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Min() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Max() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Step() {
        value := TimeSpan()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Value() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} shutterDuration 
     * @returns {IAsyncAction} 
     */
    SetValueAsync(shutterDuration) {
        result := ComCall(13, this, "ptr", shutterDuration, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}

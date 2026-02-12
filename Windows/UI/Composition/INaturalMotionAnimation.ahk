#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class INaturalMotionAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INaturalMotionAnimation
     * @type {Guid}
     */
    static IID => Guid("{438de12d-769b-4821-a949-284a6547e873}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DelayBehavior", "put_DelayBehavior", "get_DelayTime", "put_DelayTime", "get_StopBehavior", "put_StopBehavior"]

    /**
     * @type {Integer} 
     */
    DelayBehavior {
        get => this.get_DelayBehavior()
        set => this.put_DelayBehavior(value)
    }

    /**
     * @type {TimeSpan} 
     */
    DelayTime {
        get => this.get_DelayTime()
        set => this.put_DelayTime(value)
    }

    /**
     * @type {Integer} 
     */
    StopBehavior {
        get => this.get_StopBehavior()
        set => this.put_StopBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DelayBehavior() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DelayBehavior(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DelayTime() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DelayTime(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StopBehavior() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StopBehavior(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

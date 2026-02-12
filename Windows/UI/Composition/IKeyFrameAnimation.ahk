#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IKeyFrameAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyFrameAnimation
     * @type {Guid}
     */
    static IID => Guid("{126e7f22-3ae9-4540-9a8a-deae8a4a4a84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DelayTime", "put_DelayTime", "get_Duration", "put_Duration", "get_IterationBehavior", "put_IterationBehavior", "get_IterationCount", "put_IterationCount", "get_KeyFrameCount", "get_StopBehavior", "put_StopBehavior", "InsertExpressionKeyFrame", "InsertExpressionKeyFrameWithEasingFunction"]

    /**
     * @type {TimeSpan} 
     */
    DelayTime {
        get => this.get_DelayTime()
        set => this.put_DelayTime(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {Integer} 
     */
    IterationBehavior {
        get => this.get_IterationBehavior()
        set => this.put_IterationBehavior(value)
    }

    /**
     * @type {Integer} 
     */
    IterationCount {
        get => this.get_IterationCount()
        set => this.put_IterationCount(value)
    }

    /**
     * @type {Integer} 
     */
    KeyFrameCount {
        get => this.get_KeyFrameCount()
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
     * @returns {TimeSpan} 
     */
    get_DelayTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
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
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
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
    put_Duration(value) {
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
    get_IterationBehavior() {
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
    put_IterationBehavior(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IterationCount() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IterationCount(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyFrameCount() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StopBehavior() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    InsertExpressionKeyFrame(normalizedProgressKey, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "float", normalizedProgressKey, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {HSTRING} value 
     * @param {CompositionEasingFunction} easingFunction 
     * @returns {HRESULT} 
     */
    InsertExpressionKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "float", normalizedProgressKey, "ptr", value, "ptr", easingFunction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

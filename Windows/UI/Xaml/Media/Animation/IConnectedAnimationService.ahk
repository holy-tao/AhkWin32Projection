#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Composition\CompositionEasingFunction.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ConnectedAnimation.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IConnectedAnimationService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectedAnimationService
     * @type {Guid}
     */
    static IID => Guid("{1c6875c9-19bb-4d47-b9aa-66c802dcb9ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultDuration", "put_DefaultDuration", "get_DefaultEasingFunction", "put_DefaultEasingFunction", "PrepareToAnimate", "GetAnimation"]

    /**
     * @type {TimeSpan} 
     */
    DefaultDuration {
        get => this.get_DefaultDuration()
        set => this.put_DefaultDuration(value)
    }

    /**
     * @type {CompositionEasingFunction} 
     */
    DefaultEasingFunction {
        get => this.get_DefaultEasingFunction()
        set => this.put_DefaultEasingFunction(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DefaultDuration() {
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
    put_DefaultDuration(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionEasingFunction} 
     */
    get_DefaultEasingFunction() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionEasingFunction(value)
    }

    /**
     * 
     * @param {CompositionEasingFunction} value 
     * @returns {HRESULT} 
     */
    put_DefaultEasingFunction(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {UIElement} source 
     * @returns {ConnectedAnimation} 
     */
    PrepareToAnimate(key, source) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(10, this, "ptr", key, "ptr", source, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectedAnimation(result_)
    }

    /**
     * 
     * @param {HSTRING} key 
     * @returns {ConnectedAnimation} 
     */
    GetAnimation(key) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(11, this, "ptr", key, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectedAnimation(result_)
    }
}

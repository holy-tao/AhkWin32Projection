#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement8
     * @type {Guid}
     */
    static IID => Guid("{3ab70e85-d508-4477-b6f8-0e435701c836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyTipTarget", "put_KeyTipTarget", "get_KeyboardAcceleratorPlacementTarget", "put_KeyboardAcceleratorPlacementTarget", "get_KeyboardAcceleratorPlacementMode", "put_KeyboardAcceleratorPlacementMode", "add_BringIntoViewRequested", "remove_BringIntoViewRequested"]

    /**
     * @type {DependencyObject} 
     */
    KeyTipTarget {
        get => this.get_KeyTipTarget()
        set => this.put_KeyTipTarget(value)
    }

    /**
     * @type {DependencyObject} 
     */
    KeyboardAcceleratorPlacementTarget {
        get => this.get_KeyboardAcceleratorPlacementTarget()
        set => this.put_KeyboardAcceleratorPlacementTarget(value)
    }

    /**
     * @type {Integer} 
     */
    KeyboardAcceleratorPlacementMode {
        get => this.get_KeyboardAcceleratorPlacementMode()
        set => this.put_KeyboardAcceleratorPlacementMode(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_KeyTipTarget() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_KeyTipTarget(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_KeyboardAcceleratorPlacementTarget() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorPlacementTarget(value) {
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
    get_KeyboardAcceleratorPlacementMode() {
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
    put_KeyboardAcceleratorPlacementMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<UIElement, BringIntoViewRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BringIntoViewRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BringIntoViewRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

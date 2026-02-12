#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBar3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBar3
     * @type {Guid}
     */
    static IID => Guid("{40ebbc23-2a79-48b3-9a67-649b852d8589}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultLabelPosition", "put_DefaultLabelPosition", "get_OverflowButtonVisibility", "put_OverflowButtonVisibility", "get_IsDynamicOverflowEnabled", "put_IsDynamicOverflowEnabled", "add_DynamicOverflowItemsChanging", "remove_DynamicOverflowItemsChanging"]

    /**
     * @type {Integer} 
     */
    DefaultLabelPosition {
        get => this.get_DefaultLabelPosition()
        set => this.put_DefaultLabelPosition(value)
    }

    /**
     * @type {Integer} 
     */
    OverflowButtonVisibility {
        get => this.get_OverflowButtonVisibility()
        set => this.put_OverflowButtonVisibility(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDynamicOverflowEnabled {
        get => this.get_IsDynamicOverflowEnabled()
        set => this.put_IsDynamicOverflowEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultLabelPosition() {
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
    put_DefaultLabelPosition(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverflowButtonVisibility() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_OverflowButtonVisibility(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDynamicOverflowEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDynamicOverflowEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CommandBar, DynamicOverflowItemsChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DynamicOverflowItemsChanging(handler) {
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
    remove_DynamicOverflowItemsChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

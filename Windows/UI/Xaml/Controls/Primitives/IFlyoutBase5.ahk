#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBase5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBase5
     * @type {Guid}
     */
    static IID => Guid("{ad3ec0c7-12bb-5a73-b78e-105192ca73d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShowMode", "put_ShowMode", "get_InputDevicePrefersPrimaryCommands", "get_AreOpenCloseAnimationsEnabled", "put_AreOpenCloseAnimationsEnabled", "get_IsOpen", "ShowAt"]

    /**
     * @type {Integer} 
     */
    ShowMode {
        get => this.get_ShowMode()
        set => this.put_ShowMode(value)
    }

    /**
     * @type {Boolean} 
     */
    InputDevicePrefersPrimaryCommands {
        get => this.get_InputDevicePrefersPrimaryCommands()
    }

    /**
     * @type {Boolean} 
     */
    AreOpenCloseAnimationsEnabled {
        get => this.get_AreOpenCloseAnimationsEnabled()
        set => this.put_AreOpenCloseAnimationsEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ShowMode() {
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
    put_ShowMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InputDevicePrefersPrimaryCommands() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreOpenCloseAnimationsEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_AreOpenCloseAnimationsEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DependencyObject} placementTarget 
     * @param {FlyoutShowOptions} showOptions 
     * @returns {HRESULT} 
     */
    ShowAt(placementTarget, showOptions) {
        result := ComCall(12, this, "ptr", placementTarget, "ptr", showOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

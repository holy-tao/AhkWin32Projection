#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include .\WindowingEnvironment.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IDisplayRegion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayRegion
     * @type {Guid}
     */
    static IID => Guid("{db50c3a2-4094-5f47-8cb1-ea01ddafaa94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayMonitorDeviceId", "get_IsVisible", "get_WorkAreaOffset", "get_WorkAreaSize", "get_WindowingEnvironment", "add_Changed", "remove_Changed"]

    /**
     * @type {HSTRING} 
     */
    DisplayMonitorDeviceId {
        get => this.get_DisplayMonitorDeviceId()
    }

    /**
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * @type {POINT} 
     */
    WorkAreaOffset {
        get => this.get_WorkAreaOffset()
    }

    /**
     * @type {SIZE} 
     */
    WorkAreaSize {
        get => this.get_WorkAreaSize()
    }

    /**
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMonitorDeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_WorkAreaOffset() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_WorkAreaSize() {
        value := SIZE()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowingEnvironment(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayRegion, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_Changed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

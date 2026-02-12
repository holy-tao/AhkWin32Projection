#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationView
     * @type {Guid}
     */
    static IID => Guid("{d222d519-4361-451e-96c4-60f4f9742db0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Orientation", "get_AdjacentToLeftDisplayEdge", "get_AdjacentToRightDisplayEdge", "get_IsFullScreen", "get_IsOnLockScreen", "get_IsScreenCaptureEnabled", "put_IsScreenCaptureEnabled", "put_Title", "get_Title", "get_Id", "add_Consolidated", "remove_Consolidated"]

    /**
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {Boolean} 
     */
    AdjacentToLeftDisplayEdge {
        get => this.get_AdjacentToLeftDisplayEdge()
    }

    /**
     * @type {Boolean} 
     */
    AdjacentToRightDisplayEdge {
        get => this.get_AdjacentToRightDisplayEdge()
    }

    /**
     * @type {Boolean} 
     */
    IsFullScreen {
        get => this.get_IsFullScreen()
    }

    /**
     * @type {Boolean} 
     */
    IsOnLockScreen {
        get => this.get_IsOnLockScreen()
    }

    /**
     * @type {Boolean} 
     */
    IsScreenCaptureEnabled {
        get => this.get_IsScreenCaptureEnabled()
        set => this.put_IsScreenCaptureEnabled(value)
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
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
    get_AdjacentToLeftDisplayEdge() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AdjacentToRightDisplayEdge() {
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
    get_IsFullScreen() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnLockScreen() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScreenCaptureEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_IsScreenCaptureEnabled(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<ApplicationView, ApplicationViewConsolidatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Consolidated(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_Consolidated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

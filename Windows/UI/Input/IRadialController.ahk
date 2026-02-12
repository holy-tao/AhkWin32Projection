#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RadialControllerMenu.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT�RadialControllerConfiguration object and provides access to RadialControllerConfiguration members for customizing a RadialController menu.
 * @see https://learn.microsoft.com/windows/win32/api//content/radialcontrollerinterop/nn-radialcontrollerinterop-iradialcontrollerconfigurationinterop
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialController
     * @type {Guid}
     */
    static IID => Guid("{3055d1c8-df51-43d4-b23b-0e1037467a09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Menu", "get_RotationResolutionInDegrees", "put_RotationResolutionInDegrees", "get_UseAutomaticHapticFeedback", "put_UseAutomaticHapticFeedback", "add_ScreenContactStarted", "remove_ScreenContactStarted", "add_ScreenContactEnded", "remove_ScreenContactEnded", "add_ScreenContactContinued", "remove_ScreenContactContinued", "add_ControlLost", "remove_ControlLost", "add_RotationChanged", "remove_RotationChanged", "add_ButtonClicked", "remove_ButtonClicked", "add_ControlAcquired", "remove_ControlAcquired"]

    /**
     * @type {RadialControllerMenu} 
     */
    Menu {
        get => this.get_Menu()
    }

    /**
     * @type {Float} 
     */
    RotationResolutionInDegrees {
        get => this.get_RotationResolutionInDegrees()
        set => this.put_RotationResolutionInDegrees(value)
    }

    /**
     * @type {Boolean} 
     */
    UseAutomaticHapticFeedback {
        get => this.get_UseAutomaticHapticFeedback()
        set => this.put_UseAutomaticHapticFeedback(value)
    }

    /**
     * 
     * @returns {RadialControllerMenu} 
     */
    get_Menu() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerMenu(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationResolutionInDegrees() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationResolutionInDegrees(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseAutomaticHapticFeedback() {
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
    put_UseAutomaticHapticFeedback(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerScreenContactStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenContactStarted(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ScreenContactStarted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(12, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenContactEnded(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ScreenContactEnded(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(14, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerScreenContactContinuedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenContactContinued(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ScreenContactContinued(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(16, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ControlLost(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ControlLost(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(18, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerRotationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RotationChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_RotationChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerButtonClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonClicked(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
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
    remove_ButtonClicked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerControlAcquiredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ControlAcquired(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ControlAcquired(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(24, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

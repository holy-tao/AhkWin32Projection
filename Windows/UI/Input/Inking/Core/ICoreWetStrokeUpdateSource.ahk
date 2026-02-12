#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\InkPresenter.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWetStrokeUpdateSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWetStrokeUpdateSource
     * @type {Guid}
     */
    static IID => Guid("{1f718e22-ee52-4e00-8209-4c3e5b21a3cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_WetStrokeStarting", "remove_WetStrokeStarting", "add_WetStrokeContinuing", "remove_WetStrokeContinuing", "add_WetStrokeStopping", "remove_WetStrokeStopping", "add_WetStrokeCompleted", "remove_WetStrokeCompleted", "add_WetStrokeCanceled", "remove_WetStrokeCanceled", "get_InkPresenter"]

    /**
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeStarting(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_WetStrokeStarting(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeContinuing(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_WetStrokeContinuing(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeStopping(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_WetStrokeStopping(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeCompleted(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_WetStrokeCompleted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(13, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeCanceled(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_WetStrokeCanceled(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(15, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenter(value)
    }
}

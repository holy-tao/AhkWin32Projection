#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\InkPresenter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokeInput extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeInput
     * @type {Guid}
     */
    static IID => Guid("{cf2ffe7b-5e10-43c6-a080-88f26e1dc67d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_StrokeStarted", "remove_StrokeStarted", "add_StrokeContinued", "remove_StrokeContinued", "add_StrokeEnded", "remove_StrokeEnded", "add_StrokeCanceled", "remove_StrokeCanceled", "get_InkPresenter"]

    /**
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeStarted(handler) {
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
    remove_StrokeStarted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeContinued(handler) {
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
    remove_StrokeContinued(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeEnded(handler) {
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
    remove_StrokeEnded(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeCanceled(handler) {
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
    remove_StrokeCanceled(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(13, this, "ptr", cookie, "int")
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
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkPresenter(value)
    }
}

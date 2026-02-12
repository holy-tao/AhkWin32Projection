#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreDispatcher.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the base interface for an input source used by a [CoreWindow](corewindow.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInputSourceBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputSourceBase
     * @type {Guid}
     */
    static IID => Guid("{9f488807-4580-4be8-be68-92a9311713bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Dispatcher", "get_IsInputEnabled", "put_IsInputEnabled", "add_InputEnabled", "remove_InputEnabled"]

    /**
     * Gets the event dispatcher for the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * Gets or sets a value that indicates whether input is enabled for the UWP app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase.isinputenabled
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreDispatcher(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInputEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsInputEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, InputEnabledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputEnabled(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_InputEnabled(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(10, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

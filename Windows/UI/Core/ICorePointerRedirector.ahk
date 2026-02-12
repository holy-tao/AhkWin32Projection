#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines pointer events for cross-process input handling.
  * 
  * An implementation of the ICorePointerRedirector interface is provided by the [CoreWindow](corewindow.md) class.
  * 
  * Input chaining refers to the interaction behavior of both a parent object (host) and a nested child object (component) when an input boundary is reached.
  * 
  * In a single process, chaining embedded (or nested) content is managed by the system (through [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal)).
  * 
  * For cross-process chaining, the pointer events defined in this interface provide input routing details.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icorepointerredirector
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICorePointerRedirector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorePointerRedirector
     * @type {Guid}
     */
    static IID => Guid("{8f9d0c94-5688-4b0c-a9f1-f931f7fa3dc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PointerRoutedAway", "remove_PointerRoutedAway", "add_PointerRoutedTo", "remove_PointerRoutedTo", "add_PointerRoutedReleased", "remove_PointerRoutedReleased"]

    /**
     * 
     * @param {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerRoutedAway(handler) {
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
    remove_PointerRoutedAway(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerRoutedTo(handler) {
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
    remove_PointerRoutedTo(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ICorePointerRedirector, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerRoutedReleased(handler) {
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
    remove_PointerRoutedReleased(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

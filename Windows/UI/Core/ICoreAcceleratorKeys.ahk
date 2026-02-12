#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides an interface that defines the basic behavior for an accelerator key.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.icoreacceleratorkeys
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreAcceleratorKeys extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreAcceleratorKeys
     * @type {Guid}
     */
    static IID => Guid("{9ffdf7f5-b8c9-4ef0-b7d2-1de626561fc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AcceleratorKeyActivated", "remove_AcceleratorKeyActivated"]

    /**
     * 
     * @param {TypedEventHandler<CoreDispatcher, AcceleratorKeyEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AcceleratorKeyActivated(handler) {
        pCookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", pCookie, "int")
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
    remove_AcceleratorKeyActivated(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

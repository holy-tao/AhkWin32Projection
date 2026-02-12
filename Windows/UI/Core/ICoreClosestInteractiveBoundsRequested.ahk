#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreClosestInteractiveBoundsRequested extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreClosestInteractiveBoundsRequested
     * @type {Guid}
     */
    static IID => Guid("{f303043a-e8bf-4e8e-ae69-c9dadd57a114}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ClosestInteractiveBoundsRequested", "remove_ClosestInteractiveBoundsRequested"]

    /**
     * 
     * @param {TypedEventHandler<CoreComponentInputSource, ClosestInteractiveBoundsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ClosestInteractiveBoundsRequested(handler) {
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
    remove_ClosestInteractiveBoundsRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

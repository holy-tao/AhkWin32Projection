#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UserActivityRequestManager](/uwp/api/windows.applicationmodel.useractivities.useractivityrequestmanager) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/useractivityinterop/nn-useractivityinterop-iuseractivityrequestmanagerinterop
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityRequestManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityRequestManager
     * @type {Guid}
     */
    static IID => Guid("{0c30be4e-903d-48d6-82d4-4043ed57791b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_UserActivityRequested", "remove_UserActivityRequested"]

    /**
     * 
     * @param {TypedEventHandler<UserActivityRequestManager, UserActivityRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserActivityRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_UserActivityRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

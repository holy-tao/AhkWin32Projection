#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [UserActivityRequestManager](/uwp/api/windows.applicationmodel.useractivities.useractivityrequestmanager) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/useractivityinterop/nn-useractivityinterop-iuseractivityrequestmanagerinterop
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityRequest
     * @type {Guid}
     */
    static IID => Guid("{a0ef6355-cf35-4ff0-8833-50cb4b72e06d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUserActivity"]

    /**
     * 
     * @param {UserActivity} activity 
     * @returns {HRESULT} 
     */
    SetUserActivity(activity) {
        result := ComCall(6, this, "ptr", activity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HSTRING.ahk
#Include .\IInspectable.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/useractivityinterop/nn-useractivityinterop-iuseractivitysourcehostinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IUserActivitySourceHostInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivitySourceHostInterop
     * @type {Guid}
     */
    static IID => Guid("{c15df8bc-8844-487a-b85b-7578e0f61419}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetActivitySourceHost"]

    /**
     * Associates host information with either a [UserActivityChannel](/uwp/api/windows.applicationmodel.useractivities.useractivitychannel) or the [UserActivity](/uwp/api/windows.applicationmodel.useractivities.useractivity) object.
     * @remarks
     * The host information for a **UserActivity** object only needs to set with this method if the **UserActivity** object was constructed from a source other than a **UserActivityChannel**, such as by using the **UserActivity** constructor.
     * @param {HSTRING} activitySourceHost An **HSTRING** containing the host to be associated with the user activity.
     * @returns {HRESULT} If this function succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/useractivityinterop/nf-useractivityinterop-iuseractivitysourcehostinterop-setactivitysourcehost
     */
    SetActivitySourceHost(activitySourceHost) {
        if(activitySourceHost is String) {
            pin := HSTRING.Create(activitySourceHost)
            activitySourceHost := pin.Value
        }
        activitySourceHost := activitySourceHost is Win32Handle ? NumGet(activitySourceHost, "ptr") : activitySourceHost

        result := ComCall(6, this, "ptr", activitySourceHost, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

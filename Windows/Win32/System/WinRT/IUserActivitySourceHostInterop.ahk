#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * 
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//useractivityinterop/nn-useractivityinterop-iuseractivitysourcehostinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IUserActivitySourceHostInterop extends IInspectable{
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
     * 
     * @param {HSTRING} activitySourceHost 
     * @returns {HRESULT} 
     */
    SetActivitySourceHost(activitySourceHost) {
        activitySourceHost := activitySourceHost is Win32Handle ? NumGet(activitySourceHost, "ptr") : activitySourceHost

        result := ComCall(6, this, "ptr", activitySourceHost, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

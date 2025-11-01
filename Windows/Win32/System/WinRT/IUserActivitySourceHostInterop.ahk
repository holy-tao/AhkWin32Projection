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
     * 
     * @param {HSTRING} activitySourceHost 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/useractivityinterop/nf-useractivityinterop-iuseractivitysourcehostinterop-setactivitysourcehost
     */
    SetActivitySourceHost(activitySourceHost) {
        activitySourceHost := activitySourceHost is Win32Handle ? NumGet(activitySourceHost, "ptr") : activitySourceHost

        result := ComCall(6, this, "ptr", activitySourceHost, "HRESULT")
        return result
    }
}

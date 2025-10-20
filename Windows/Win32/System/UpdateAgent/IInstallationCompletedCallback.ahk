#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Handles the notification that indicates that an asynchronous installation or uninstallation is complete.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationcompletedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationCompletedCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationCompletedCallback
     * @type {Guid}
     */
    static IID => Guid("{45f4f6f3-d602-4f98-9a8a-3efa152ad2d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * 
     * @param {IInstallationJob} installationJob 
     * @param {IInstallationCompletedCallbackArgs} callbackArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationcompletedcallback-invoke
     */
    Invoke(installationJob, callbackArgs) {
        result := ComCall(3, this, "ptr", installationJob, "ptr", callbackArgs, "HRESULT")
        return result
    }
}

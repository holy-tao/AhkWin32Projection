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
     * 
     * @param {Pointer<IInstallationJob>} installationJob 
     * @param {Pointer<IInstallationCompletedCallbackArgs>} callbackArgs 
     * @returns {HRESULT} 
     */
    Invoke(installationJob, callbackArgs) {
        result := ComCall(3, this, "ptr", installationJob, "ptr", callbackArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

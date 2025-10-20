#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the Invoke method that handles the notification about the on-going progress of an asynchronous installation or uninstallation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationprogresschangedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationProgressChangedCallback extends IUnknown{
    /**
     * The interface identifier for IInstallationProgressChangedCallback
     * @type {Guid}
     */
    static IID => Guid("{e01402d5-f8da-43ba-a012-38894bd048f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IInstallationJob>} installationJob 
     * @param {Pointer<IInstallationProgressChangedCallbackArgs>} callbackArgs 
     * @returns {HRESULT} 
     */
    Invoke(installationJob, callbackArgs) {
        result := ComCall(3, this, "ptr", installationJob, "ptr", callbackArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

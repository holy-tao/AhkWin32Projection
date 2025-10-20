#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Handles the notification that indicates a change in the progress of an asynchronous download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadprogresschangedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadProgressChangedCallback extends IUnknown{
    /**
     * The interface identifier for IDownloadProgressChangedCallback
     * @type {Guid}
     */
    static IID => Guid("{8c3f1cdd-6173-4591-aebd-a56a53ca77c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDownloadJob>} downloadJob 
     * @param {Pointer<IDownloadProgressChangedCallbackArgs>} callbackArgs 
     * @returns {HRESULT} 
     */
    Invoke(downloadJob, callbackArgs) {
        result := ComCall(3, this, "ptr", downloadJob, "ptr", callbackArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

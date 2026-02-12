#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles progress update events for a background task.
 * @remarks
 * Progress update events are delivered only while the application is in the foreground.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskprogresseventhandler
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskProgressEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for BackgroundTaskProgressEventHandler
     * @type {Guid}
     */
    static IID => Guid("{46e0683c-8a88-4c99-804c-76897f6277a6}")

    /**
     * The class identifier for BackgroundTaskProgressEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{46e0683c-8a88-4c99-804c-76897f6277a6}")

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
     * Invokes helper functionality for the IDispatch interface.
     * @param {BackgroundTaskRegistration} sender 
     * @param {BackgroundTaskProgressEventArgs} args 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, args) {
        result := ComCall(3, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

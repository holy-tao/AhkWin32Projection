#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information when an app is activated at device startup or user login.
 * @remarks
 * This functionality is only supported on Windows Desktop.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.istartuptaskactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IStartupTaskActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStartupTaskActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{03b11a58-5276-4d91-8621-54611864d5fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskId"]

    /**
     * Gets the unique ID of the startup task
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.istartuptaskactivatedeventargs.taskid
     * @type {HSTRING} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

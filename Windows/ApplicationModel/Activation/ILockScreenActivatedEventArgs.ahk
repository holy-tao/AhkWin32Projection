#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an event that occurs when the app is activated as the lock screen.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilockscreenactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ILockScreenActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockScreenActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3ca77966-6108-4a41-8220-ee7d133c8532}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Info"]

    /**
     * Gets an object that allows an app that is activated as the lock screen to get the same data that the default lock screen can access, and to register for updates to that data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilockscreenactivatedeventargs.info
     * @type {IInspectable} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Info() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }
}

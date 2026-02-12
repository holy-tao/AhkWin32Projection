#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Calls\LockScreenCallUI.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides event information when communication to and from the lock screen is required.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilockscreencallactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ILockScreenCallActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockScreenCallActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{06f37fbe-b5f2-448b-b13e-e328ac1c516a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CallUI"]

    /**
     * Gets the UI that handles communication to and from the lock screen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilockscreencallactivatedeventargs.callui
     * @type {LockScreenCallUI} 
     */
    CallUI {
        get => this.get_CallUI()
    }

    /**
     * 
     * @returns {LockScreenCallUI} 
     */
    get_CallUI() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LockScreenCallUI(value)
    }
}

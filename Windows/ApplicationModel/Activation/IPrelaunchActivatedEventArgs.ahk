#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides event information about whether an app is in pre-launch state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprelaunchactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IPrelaunchActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrelaunchActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{0c44717b-19f7-48d6-b046-cf22826eaa74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrelaunchActivated"]

    /**
     * Gets an indication about whether a pre-launch has been activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprelaunchactivatedeventargs.prelaunchactivated
     * @type {Boolean} 
     */
    PrelaunchActivated {
        get => this.get_PrelaunchActivated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PrelaunchActivated() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

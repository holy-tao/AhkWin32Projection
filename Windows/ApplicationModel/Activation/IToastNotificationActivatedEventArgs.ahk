#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an event that occurs when the app is activated because a user tapped on the body of a toast notification or performed an action inside a toast notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.itoastnotificationactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IToastNotificationActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{92a86f82-5290-431d-be85-c4aaeeb8685f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Argument", "get_UserInput"]

    /**
     * Gets the arguments that the app can retrieve after it is activated through an interactive toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.itoastnotificationactivatedeventargs.argument
     * @type {HSTRING} 
     */
    Argument {
        get => this.get_Argument()
    }

    /**
     * Gets a set of values that you can use to obtain the user input from an interactive toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.itoastnotificationactivatedeventargs.userinput
     * @type {ValueSet} 
     */
    UserInput {
        get => this.get_UserInput()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Argument() {
        argument := HSTRING()
        result := ComCall(6, this, "ptr", argument, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return argument
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_UserInput() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}

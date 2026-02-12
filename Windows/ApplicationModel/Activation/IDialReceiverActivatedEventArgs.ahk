#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated from another app by using the DIAL protocol.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.idialreceiveractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IDialReceiverActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialReceiverActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fb777ed7-85ee-456e-a44d-85d730e70aed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppName"]

    /**
     * Gets the name of the app that invoked the dial receiver app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.idialreceiveractivatedeventargs.appname
     * @type {HSTRING} 
     */
    AppName {
        get => this.get_AppName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the launch arguments for the application. The app’s `OnActivated` method will be invoked with the `PhoneCallActivatedEventArgs` class being the `activatedEventArg` payload.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iphonecallactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IPhoneCallActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{54615221-a3c1-4ced-b62f-8c60523619ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LineId"]

    /**
     * Identifies the PhoneLine being used. Used to retrieve a corresponding PhoneLine object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iphonecallactivatedeventargs.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

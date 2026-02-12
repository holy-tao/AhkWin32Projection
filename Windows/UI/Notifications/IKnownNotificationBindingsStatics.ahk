#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IKnownNotificationBindingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownNotificationBindingsStatics
     * @type {Guid}
     */
    static IID => Guid("{79427bae-a8b7-4d58-89ea-76a7b7bccded}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ToastGeneric"]

    /**
     * @type {HSTRING} 
     */
    ToastGeneric {
        get => this.get_ToastGeneric()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ToastGeneric() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

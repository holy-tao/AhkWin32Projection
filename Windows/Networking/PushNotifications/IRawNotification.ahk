#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class IRawNotification extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawNotification
     * @type {Guid}
     */
    static IID => Guid("{1a227281-3b79-42ac-9963-22ab00d4f0b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content"]

    /**
     * @type {HSTRING} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Content() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

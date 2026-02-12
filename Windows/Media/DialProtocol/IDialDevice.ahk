#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DialApp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialDevice
     * @type {Guid}
     */
    static IID => Guid("{fff0edaf-759f-41d2-a20a-7f29ce0b3784}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "GetDialApp"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} appName 
     * @returns {DialApp} 
     */
    GetDialApp(appName) {
        if(appName is String) {
            pin := HSTRING.Create(appName)
            appName := pin.Value
        }
        appName := appName is Win32Handle ? NumGet(appName, "ptr") : appName

        result := ComCall(7, this, "ptr", appName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DialApp(value)
    }
}

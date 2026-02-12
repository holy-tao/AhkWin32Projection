#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IKnownContactFieldStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownContactFieldStatics
     * @type {Guid}
     */
    static IID => Guid("{2e0e1b12-d627-4fca-bad4-1faf168c7d14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Email", "get_PhoneNumber", "get_Location", "get_InstantMessage", "ConvertNameToType", "ConvertTypeToName"]

    /**
     * @type {HSTRING} 
     */
    Email {
        get => this.get_Email()
    }

    /**
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * @type {HSTRING} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {HSTRING} 
     */
    InstantMessage {
        get => this.get_InstantMessage()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Email() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Location() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstantMessage() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {Integer} 
     */
    ConvertNameToType(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "int*", &type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return type
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HSTRING} 
     */
    ConvertTypeToName(type) {
        name := HSTRING()
        result := ComCall(11, this, "int", type, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterfaceDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterfaceDescriptor
     * @type {Guid}
     */
    static IID => Guid("{199670c7-b7ee-4f90-8cd5-94a2e257598a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClassCode", "get_SubclassCode", "get_ProtocolCode", "get_AlternateSettingNumber", "get_InterfaceNumber"]

    /**
     * @type {Integer} 
     */
    ClassCode {
        get => this.get_ClassCode()
    }

    /**
     * @type {Integer} 
     */
    SubclassCode {
        get => this.get_SubclassCode()
    }

    /**
     * @type {Integer} 
     */
    ProtocolCode {
        get => this.get_ProtocolCode()
    }

    /**
     * @type {Integer} 
     */
    AlternateSettingNumber {
        get => this.get_AlternateSettingNumber()
    }

    /**
     * @type {Integer} 
     */
    InterfaceNumber {
        get => this.get_InterfaceNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClassCode() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubclassCode() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtocolCode() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlternateSettingNumber() {
        result := ComCall(9, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterfaceNumber() {
        result := ComCall(10, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

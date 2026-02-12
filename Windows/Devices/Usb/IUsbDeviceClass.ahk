#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbDeviceClass extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbDeviceClass
     * @type {Guid}
     */
    static IID => Guid("{051942f9-845e-47eb-b12a-38f2f617afe7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClassCode", "put_ClassCode", "get_SubclassCode", "put_SubclassCode", "get_ProtocolCode", "put_ProtocolCode"]

    /**
     * @type {Integer} 
     */
    ClassCode {
        get => this.get_ClassCode()
        set => this.put_ClassCode(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    SubclassCode {
        get => this.get_SubclassCode()
        set => this.put_SubclassCode(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    ProtocolCode {
        get => this.get_ProtocolCode()
        set => this.put_ProtocolCode(value)
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClassCode(value) {
        result := ComCall(7, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SubclassCode() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetByte(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_SubclassCode(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolCode() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetByte(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ProtocolCode(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

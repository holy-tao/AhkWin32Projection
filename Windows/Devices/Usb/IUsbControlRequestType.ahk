#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbControlRequestType extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbControlRequestType
     * @type {Guid}
     */
    static IID => Guid("{8e9465a6-d73d-46de-94be-aae7f07c0f5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Direction", "put_Direction", "get_ControlTransferType", "put_ControlTransferType", "get_Recipient", "put_Recipient", "get_AsByte", "put_AsByte"]

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * @type {Integer} 
     */
    ControlTransferType {
        get => this.get_ControlTransferType()
        set => this.put_ControlTransferType(value)
    }

    /**
     * @type {Integer} 
     */
    Recipient {
        get => this.get_Recipient()
        set => this.put_Recipient(value)
    }

    /**
     * @type {Integer} 
     */
    AsByte {
        get => this.get_AsByte()
        set => this.put_AsByte(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_Direction(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlTransferType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_ControlTransferType(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Recipient() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_Recipient(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AsByte() {
        result := ComCall(12, this, "char*", &value := 0, "int")
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
    put_AsByte(value) {
        result := ComCall(13, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

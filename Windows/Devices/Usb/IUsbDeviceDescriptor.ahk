#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbDeviceDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbDeviceDescriptor
     * @type {Guid}
     */
    static IID => Guid("{1f48d1f6-ba97-4322-b92c-b5b189216588}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BcdUsb", "get_MaxPacketSize0", "get_VendorId", "get_ProductId", "get_BcdDeviceRevision", "get_NumberOfConfigurations"]

    /**
     * @type {Integer} 
     */
    BcdUsb {
        get => this.get_BcdUsb()
    }

    /**
     * @type {Integer} 
     */
    MaxPacketSize0 {
        get => this.get_MaxPacketSize0()
    }

    /**
     * @type {Integer} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * @type {Integer} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * @type {Integer} 
     */
    BcdDeviceRevision {
        get => this.get_BcdDeviceRevision()
    }

    /**
     * @type {Integer} 
     */
    NumberOfConfigurations {
        get => this.get_NumberOfConfigurations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BcdUsb() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPacketSize0() {
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
    get_VendorId() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductId() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BcdDeviceRevision() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfConfigurations() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

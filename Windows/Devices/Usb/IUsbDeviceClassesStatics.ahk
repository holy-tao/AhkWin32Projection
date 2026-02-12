#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbDeviceClass.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbDeviceClassesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbDeviceClassesStatics
     * @type {Guid}
     */
    static IID => Guid("{b20b0527-c580-4599-a165-981b4fd03230}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CdcControl", "get_Physical", "get_PersonalHealthcare", "get_ActiveSync", "get_PalmSync", "get_DeviceFirmwareUpdate", "get_Irda", "get_Measurement", "get_VendorSpecific"]

    /**
     * @type {UsbDeviceClass} 
     */
    CdcControl {
        get => this.get_CdcControl()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    Physical {
        get => this.get_Physical()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    PersonalHealthcare {
        get => this.get_PersonalHealthcare()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    ActiveSync {
        get => this.get_ActiveSync()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    PalmSync {
        get => this.get_PalmSync()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    DeviceFirmwareUpdate {
        get => this.get_DeviceFirmwareUpdate()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    Irda {
        get => this.get_Irda()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    Measurement {
        get => this.get_Measurement()
    }

    /**
     * @type {UsbDeviceClass} 
     */
    VendorSpecific {
        get => this.get_VendorSpecific()
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_CdcControl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_Physical() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_PersonalHealthcare() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_ActiveSync() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_PalmSync() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_DeviceFirmwareUpdate() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_Irda() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_Measurement() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }

    /**
     * 
     * @returns {UsbDeviceClass} 
     */
    get_VendorSpecific() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceClass(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbConfigurationDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbConfigurationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{f2176d92-b442-407a-8207-7d646c0385f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConfigurationValue", "get_MaxPowerMilliamps", "get_SelfPowered", "get_RemoteWakeup"]

    /**
     * @type {Integer} 
     */
    ConfigurationValue {
        get => this.get_ConfigurationValue()
    }

    /**
     * @type {Integer} 
     */
    MaxPowerMilliamps {
        get => this.get_MaxPowerMilliamps()
    }

    /**
     * @type {Boolean} 
     */
    SelfPowered {
        get => this.get_SelfPowered()
    }

    /**
     * @type {Boolean} 
     */
    RemoteWakeup {
        get => this.get_RemoteWakeup()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConfigurationValue() {
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
    get_MaxPowerMilliamps() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelfPowered() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemoteWakeup() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

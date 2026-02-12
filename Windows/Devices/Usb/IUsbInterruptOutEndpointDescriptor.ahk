#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\UsbInterruptOutPipe.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterruptOutEndpointDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterruptOutEndpointDescriptor
     * @type {Guid}
     */
    static IID => Guid("{cc9fed81-10ca-4533-952d-9e278341e80f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPacketSize", "get_EndpointNumber", "get_Interval", "get_Pipe"]

    /**
     * @type {Integer} 
     */
    MaxPacketSize {
        get => this.get_MaxPacketSize()
    }

    /**
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * @type {TimeSpan} 
     */
    Interval {
        get => this.get_Interval()
    }

    /**
     * @type {UsbInterruptOutPipe} 
     */
    Pipe {
        get => this.get_Pipe()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPacketSize() {
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
    get_EndpointNumber() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Interval() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UsbInterruptOutPipe} 
     */
    get_Pipe() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterruptOutPipe(value)
    }
}

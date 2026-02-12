#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbInterruptOutEndpointDescriptor.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterruptOutPipe extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterruptOutPipe
     * @type {Guid}
     */
    static IID => Guid("{e984c8a9-aaf9-49d0-b96c-f661ab4a7f95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EndpointDescriptor", "ClearStallAsync", "put_WriteOptions", "get_WriteOptions", "get_OutputStream"]

    /**
     * @type {UsbInterruptOutEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * @type {Integer} 
     */
    WriteOptions {
        get => this.get_WriteOptions()
        set => this.put_WriteOptions(value)
    }

    /**
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @returns {UsbInterruptOutEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterruptOutEndpointDescriptor(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearStallAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WriteOptions(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteOptions() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }
}

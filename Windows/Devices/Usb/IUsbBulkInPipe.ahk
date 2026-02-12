#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbBulkInEndpointDescriptor.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbBulkInPipe extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbBulkInPipe
     * @type {Guid}
     */
    static IID => Guid("{f01d2d3b-4548-4d50-b326-d82cdabe1220}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxTransferSizeBytes", "get_EndpointDescriptor", "ClearStallAsync", "put_ReadOptions", "get_ReadOptions", "FlushBuffer", "get_InputStream"]

    /**
     * @type {Integer} 
     */
    MaxTransferSizeBytes {
        get => this.get_MaxTransferSizeBytes()
    }

    /**
     * @type {UsbBulkInEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * @type {Integer} 
     */
    ReadOptions {
        get => this.get_ReadOptions()
        set => this.put_ReadOptions(value)
    }

    /**
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTransferSizeBytes() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UsbBulkInEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbBulkInEndpointDescriptor(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearStallAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
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
    put_ReadOptions(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadOptions() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushBuffer() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }
}

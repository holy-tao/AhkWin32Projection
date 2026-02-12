#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\Rfcomm\RfcommServiceId.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IRfcommInboundConnectionInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommInboundConnectionInformation
     * @type {Guid}
     */
    static IID => Guid("{6d3e75a8-5429-4059-92e3-1e8b65528707}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SdpRecord", "put_SdpRecord", "get_LocalServiceId", "put_LocalServiceId", "get_ServiceCapabilities", "put_ServiceCapabilities"]

    /**
     * @type {IBuffer} 
     */
    SdpRecord {
        get => this.get_SdpRecord()
        set => this.put_SdpRecord(value)
    }

    /**
     * @type {RfcommServiceId} 
     */
    LocalServiceId {
        get => this.get_LocalServiceId()
        set => this.put_LocalServiceId(value)
    }

    /**
     * @type {Integer} 
     */
    ServiceCapabilities {
        get => this.get_ServiceCapabilities()
        set => this.put_ServiceCapabilities(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SdpRecord() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_SdpRecord(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_LocalServiceId() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(value)
    }

    /**
     * 
     * @param {RfcommServiceId} value 
     * @returns {HRESULT} 
     */
    put_LocalServiceId(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceCapabilities() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
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
    put_ServiceCapabilities(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

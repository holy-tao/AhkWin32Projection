#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveQualityOfServiceMeasurementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveQualityOfServiceMeasurementStatics
     * @type {Guid}
     */
    static IID => Guid("{6e352dca-23cf-440a-b077-5e30857a8234}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PublishPrivatePayloadBytes", "ClearPrivatePayload", "get_MaxSimultaneousProbeConnections", "put_MaxSimultaneousProbeConnections", "get_IsSystemOutboundBandwidthConstrained", "put_IsSystemOutboundBandwidthConstrained", "get_IsSystemInboundBandwidthConstrained", "put_IsSystemInboundBandwidthConstrained", "get_PublishedPrivatePayload", "put_PublishedPrivatePayload", "get_MaxPrivatePayloadSize"]

    /**
     * @type {Integer} 
     */
    MaxSimultaneousProbeConnections {
        get => this.get_MaxSimultaneousProbeConnections()
        set => this.put_MaxSimultaneousProbeConnections(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSystemOutboundBandwidthConstrained {
        get => this.get_IsSystemOutboundBandwidthConstrained()
        set => this.put_IsSystemOutboundBandwidthConstrained(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSystemInboundBandwidthConstrained {
        get => this.get_IsSystemInboundBandwidthConstrained()
        set => this.put_IsSystemInboundBandwidthConstrained(value)
    }

    /**
     * @type {IBuffer} 
     */
    PublishedPrivatePayload {
        get => this.get_PublishedPrivatePayload()
        set => this.put_PublishedPrivatePayload(value)
    }

    /**
     * @type {Integer} 
     */
    MaxPrivatePayloadSize {
        get => this.get_MaxPrivatePayloadSize()
    }

    /**
     * 
     * @param {Integer} payload_length 
     * @param {Pointer<Integer>} payload 
     * @returns {HRESULT} 
     */
    PublishPrivatePayloadBytes(payload_length, payload) {
        payloadMarshal := payload is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", payload_length, payloadMarshal, payload, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearPrivatePayload() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSimultaneousProbeConnections() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_MaxSimultaneousProbeConnections(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSystemOutboundBandwidthConstrained() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSystemOutboundBandwidthConstrained(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSystemInboundBandwidthConstrained() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSystemInboundBandwidthConstrained(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PublishedPrivatePayload() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
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
    put_PublishedPrivatePayload(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPrivatePayloadSize() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

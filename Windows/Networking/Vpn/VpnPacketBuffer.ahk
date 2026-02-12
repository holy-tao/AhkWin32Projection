#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnPacketBuffer.ahk
#Include .\IVpnPacketBuffer2.ahk
#Include .\IVpnPacketBuffer3.ahk
#Include .\IVpnPacketBufferFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used by the platform to manage a memory buffer. **VpnPacketBuffer** allows buffers to be chained together in a **IVpnPacketBufferList** object list to be sent or received in a specific order.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnPacketBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnPacketBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnPacketBuffer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Not used.
     * @param {VpnPacketBuffer} parentBuffer A pointer to the parent buffer in the chain.
     * @param {Integer} offset Offset value.
     * @param {Integer} length The size of the buffer.
     * @returns {VpnPacketBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer.#ctor
     */
    static CreateVpnPacketBuffer(parentBuffer, offset, length) {
        if (!VpnPacketBuffer.HasProp("__IVpnPacketBufferFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnPacketBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnPacketBufferFactory.IID)
            VpnPacketBuffer.__IVpnPacketBufferFactory := IVpnPacketBufferFactory(factoryPtr)
        }

        return VpnPacketBuffer.__IVpnPacketBufferFactory.CreateVpnPacketBuffer(parentBuffer, offset, length)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the memory buffer object, designed to contain packets of date to be sent or received as part of a **IVpnPacketBufferList**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer.buffer
     * @type {WinRTBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
    }

    /**
     * Gets the status of **VpnPacketBuffer**. The status property may be used to report errors when manipulating the **IVpnPacketBufferList.**
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets or sets a number specifying which transport object to use as specified in the VpnChannel:Start* methods. This allows the selection between the main and the optional transports.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer.transportaffinity
     * @type {Integer} 
     */
    TransportAffinity {
        get => this.get_TransportAffinity()
        set => this.put_TransportAffinity(value)
    }

    /**
     * Gets the app ID representing the app that caused this packet to flow. This is present only on the first packet of a flow. The presence of this property indicates it is the first packet.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer.appid
     * @type {VpnAppId} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * Gets or sets a transport context object, for example the name of a host or server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbuffer.transportcontext
     * @type {IInspectable} 
     */
    TransportContext {
        get => this.get_TransportContext()
        set => this.put_TransportContext(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WinRTBuffer} 
     */
    get_Buffer() {
        if (!this.HasProp("__IVpnPacketBuffer")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer := IVpnPacketBuffer(outPtr)
        }

        return this.__IVpnPacketBuffer.get_Buffer()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IVpnPacketBuffer")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer := IVpnPacketBuffer(outPtr)
        }

        return this.__IVpnPacketBuffer.put_Status(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IVpnPacketBuffer")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer := IVpnPacketBuffer(outPtr)
        }

        return this.__IVpnPacketBuffer.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TransportAffinity(value) {
        if (!this.HasProp("__IVpnPacketBuffer")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer := IVpnPacketBuffer(outPtr)
        }

        return this.__IVpnPacketBuffer.put_TransportAffinity(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportAffinity() {
        if (!this.HasProp("__IVpnPacketBuffer")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer := IVpnPacketBuffer(outPtr)
        }

        return this.__IVpnPacketBuffer.get_TransportAffinity()
    }

    /**
     * 
     * @returns {VpnAppId} 
     */
    get_AppId() {
        if (!this.HasProp("__IVpnPacketBuffer2")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer2 := IVpnPacketBuffer2(outPtr)
        }

        return this.__IVpnPacketBuffer2.get_AppId()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_TransportContext(value) {
        if (!this.HasProp("__IVpnPacketBuffer3")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer3 := IVpnPacketBuffer3(outPtr)
        }

        return this.__IVpnPacketBuffer3.put_TransportContext(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TransportContext() {
        if (!this.HasProp("__IVpnPacketBuffer3")) {
            if ((queryResult := this.QueryInterface(IVpnPacketBuffer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPacketBuffer3 := IVpnPacketBuffer3(outPtr)
        }

        return this.__IVpnPacketBuffer3.get_TransportContext()
    }

;@endregion Instance Methods
}

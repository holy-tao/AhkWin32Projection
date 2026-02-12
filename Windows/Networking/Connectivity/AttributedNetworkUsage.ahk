#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAttributedNetworkUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents per-attribution usage statistics (bytes sent, bytes received, connected duration) returned by
  * [ConnectionProfile.GetAttributedNetworkUsageAsync](connectionprofile_getattributednetworkusageasync_1743384794.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.attributednetworkusage
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class AttributedNetworkUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAttributedNetworkUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAttributedNetworkUsage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of bytes sent by the app over the network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.attributednetworkusage.bytessent
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

    /**
     * Gets the number of bytes received by the app over the network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.attributednetworkusage.bytesreceived
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
    }

    /**
     * Gets the Id of the app.
     * @remarks
     * Activity attributed to the system is reported with an empty string as the AttributionId.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.attributednetworkusage.attributionid
     * @type {HSTRING} 
     */
    AttributionId {
        get => this.get_AttributionId()
    }

    /**
     * Gets the name of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.attributednetworkusage.attributionname
     * @type {HSTRING} 
     */
    AttributionName {
        get => this.get_AttributionName()
    }

    /**
     * Gets the thumbnail of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.attributednetworkusage.attributionthumbnail
     * @type {IRandomAccessStreamReference} 
     */
    AttributionThumbnail {
        get => this.get_AttributionThumbnail()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesSent() {
        if (!this.HasProp("__IAttributedNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IAttributedNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAttributedNetworkUsage := IAttributedNetworkUsage(outPtr)
        }

        return this.__IAttributedNetworkUsage.get_BytesSent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        if (!this.HasProp("__IAttributedNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IAttributedNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAttributedNetworkUsage := IAttributedNetworkUsage(outPtr)
        }

        return this.__IAttributedNetworkUsage.get_BytesReceived()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AttributionId() {
        if (!this.HasProp("__IAttributedNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IAttributedNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAttributedNetworkUsage := IAttributedNetworkUsage(outPtr)
        }

        return this.__IAttributedNetworkUsage.get_AttributionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AttributionName() {
        if (!this.HasProp("__IAttributedNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IAttributedNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAttributedNetworkUsage := IAttributedNetworkUsage(outPtr)
        }

        return this.__IAttributedNetworkUsage.get_AttributionName()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_AttributionThumbnail() {
        if (!this.HasProp("__IAttributedNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IAttributedNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAttributedNetworkUsage := IAttributedNetworkUsage(outPtr)
        }

        return this.__IAttributedNetworkUsage.get_AttributionThumbnail()
    }

;@endregion Instance Methods
}

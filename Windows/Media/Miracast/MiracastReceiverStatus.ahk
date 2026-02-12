#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object which provides information about the current status of the [MiracastReceiver](miracastreceiver.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstatus
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns a value that describes the status of the Miracast Receiver as it pertains to its ability to listen for incoming conections.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstatus.listeningstatus
     * @type {Integer} 
     */
    ListeningStatus {
        get => this.get_ListeningStatus()
    }

    /**
     * Returns status information about the Miracast Receiver's Wi-Fi functionality.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstatus.wifistatus
     * @type {Integer} 
     */
    WiFiStatus {
        get => this.get_WiFiStatus()
    }

    /**
     * Specifies if it is possible to let a new Miracast connection take over an in-progress Miracast connection.
     * @remarks
     * The value of this property is hardware-dependent.
     * If the property value is true, use to [MiracastReceiverSession.AllowConnectionTakeover](miracastreceiversession_allowconnectiontakeover.md) to control if connections for a given MiracastReceiverSession can be taken over.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstatus.isconnectiontakeoversupported
     * @type {Boolean} 
     */
    IsConnectionTakeoverSupported {
        get => this.get_IsConnectionTakeoverSupported()
    }

    /**
     * Specifies the maximum number of simultaneous connections that the Miracast Receiver can handle.
     * @remarks
     * The value of this property is hardware-dependent.
     * If the property value is greater than 1, use to [MiracastReceiverSession.MaxSimultaneousConnections](miracastreceiversession_maxsimultaneousconnections.md) to control the maximum number of simultaneous connections for a given MiracastReceiverSession.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstatus.maxsimultaneousconnections
     * @type {Integer} 
     */
    MaxSimultaneousConnections {
        get => this.get_MaxSimultaneousConnections()
    }

    /**
     * Returns the collection of Miracast Transmitters that are currently known to the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * A Miracast Transmitter becomes known if a Miracast connection was received previously, and was not rejected.
     * Use [MiracastReceiver.RemoveKnownTransmitter](miracastreceiver_removeknowntransmitter_1355701555.md) and [MiracastReceiver.ClearKnownTransmitters](miracastreceiver_clearknowntransmitters_1513662921.md) to manage the list of known Miracast Transmitters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverstatus.knowntransmitters
     * @type {IVectorView<MiracastTransmitter>} 
     */
    KnownTransmitters {
        get => this.get_KnownTransmitters()
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
    get_ListeningStatus() {
        if (!this.HasProp("__IMiracastReceiverStatus")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStatus := IMiracastReceiverStatus(outPtr)
        }

        return this.__IMiracastReceiverStatus.get_ListeningStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WiFiStatus() {
        if (!this.HasProp("__IMiracastReceiverStatus")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStatus := IMiracastReceiverStatus(outPtr)
        }

        return this.__IMiracastReceiverStatus.get_WiFiStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnectionTakeoverSupported() {
        if (!this.HasProp("__IMiracastReceiverStatus")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStatus := IMiracastReceiverStatus(outPtr)
        }

        return this.__IMiracastReceiverStatus.get_IsConnectionTakeoverSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSimultaneousConnections() {
        if (!this.HasProp("__IMiracastReceiverStatus")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStatus := IMiracastReceiverStatus(outPtr)
        }

        return this.__IMiracastReceiverStatus.get_MaxSimultaneousConnections()
    }

    /**
     * 
     * @returns {IVectorView<MiracastTransmitter>} 
     */
    get_KnownTransmitters() {
        if (!this.HasProp("__IMiracastReceiverStatus")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverStatus := IMiracastReceiverStatus(outPtr)
        }

        return this.__IMiracastReceiverStatus.get_KnownTransmitters()
    }

;@endregion Instance Methods
}

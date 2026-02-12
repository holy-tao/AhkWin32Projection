#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverConnectionCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MiracastReceiverSession.ConnectionCreated](miracastreceiversession_connectioncreated.md) event.
 * @remarks
 * The new connection is considered accepted when the event handler returns, or when the deferral is completed. To reject an unwanted connection, invoke [MiracastReceiverConnection.Disconnect](miracastreceiverconnection_disconnect_1844911223.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnectioncreatedeventargs
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverConnectionCreatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverConnectionCreatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverConnectionCreatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MiracastReceiverConnection](miracastreceiverconnection.md) object of the newly created connection.
     * @remarks
     * The new connection is considered accepted when the event handler returns, or when the deferral is completed. To reject an unwanted connection, invoke [MiracastReceiverConnection.Disconnect](miracastreceiverconnection_disconnect_554373577.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnectioncreatedeventargs.connection
     * @type {MiracastReceiverConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * Getes the PIN that must be entered by the Miracast Transmitter device, or an empty string if PIN authentication is not in use.
     * @remarks
     * If the string is not empty, the app should display the PIN so that it can be entered on the Miracast Transmitter device.
     * The connection will be automatically disconnected if the PIN is not entered by the Miracast Transmitter in approximately 30 seconds.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnectioncreatedeventargs.pin
     * @type {HSTRING} 
     */
    Pin {
        get => this.get_Pin()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MiracastReceiverConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IMiracastReceiverConnectionCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnectionCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnectionCreatedEventArgs := IMiracastReceiverConnectionCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverConnectionCreatedEventArgs.get_Connection()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pin() {
        if (!this.HasProp("__IMiracastReceiverConnectionCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnectionCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnectionCreatedEventArgs := IMiracastReceiverConnectionCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverConnectionCreatedEventArgs.get_Pin()
    }

    /**
     * Defers completion of the [MiracastReceiverSession.ConnectionCreated](miracastreceiversession_connectioncreated.md) event until [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) is invoked.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverconnectioncreatedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMiracastReceiverConnectionCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverConnectionCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverConnectionCreatedEventArgs := IMiracastReceiverConnectionCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverConnectionCreatedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}

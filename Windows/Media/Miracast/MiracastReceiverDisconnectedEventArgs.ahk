#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverDisconnectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MiracastReceiverSession.Disconnected](miracastreceiversession_disconnected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverdisconnectedeventargs
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverDisconnectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverDisconnectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverDisconnectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the [MiracastReceiverConnection](miracastreceiverconnection.md) object of the connection that has been disconnected.
     * @remarks
     * Since a [MiracastReceiverSession](miracastreceiversession.md) can operate on multiple connections, use the Connection property to determine which connection the event refers to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverdisconnectedeventargs.connection
     * @type {MiracastReceiverConnection} 
     */
    Connection {
        get => this.get_Connection()
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
        if (!this.HasProp("__IMiracastReceiverDisconnectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverDisconnectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverDisconnectedEventArgs := IMiracastReceiverDisconnectedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverDisconnectedEventArgs.get_Connection()
    }

;@endregion Instance Methods
}

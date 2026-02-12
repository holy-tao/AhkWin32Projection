#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverMediaSourceCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MiracastReceiverSession.MediaSourceCreated](miracastreceiversession_mediasourcecreated.md) event.
 * @remarks
 * This event is raised after the MediaReceiverSession.ConnectionCreated event, if the Connection remains connected.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivermediasourcecreatedeventargs
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverMediaSourceCreatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverMediaSourceCreatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverMediaSourceCreatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the [MiracastReceiverConnection](miracastreceiverconnection.md) object of the associated connection.
     * @remarks
     * Since a [MiracastReceiverSession](miracastreceiversession.md) can operate on multiple connections, use the Connection property to determine which connection the event refers to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivermediasourcecreatedeventargs.connection
     * @type {MiracastReceiverConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * Returns a [MediaSource](/uwp/api/windows.media.core.mediasource) object for playing the audio and video data that is being sent by the Miracast Transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivermediasourcecreatedeventargs.mediasource
     * @type {MediaSource} 
     */
    MediaSource {
        get => this.get_MediaSource()
    }

    /**
     * Returns an object for configuring the settings of the optional cursor image channel.
     * @remarks
     * The configuration settings for the cursor image channel take effect when the event is completed. Use [MiracastReceiverMediaSourceCreatedEventArgs.GetDeferral](miracastreceivermediasourcecreatedeventargs_getdeferral_254836512.md) to delay the completion of the event, if needed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivermediasourcecreatedeventargs.cursorimagechannelsettings
     * @type {MiracastReceiverCursorImageChannelSettings} 
     */
    CursorImageChannelSettings {
        get => this.get_CursorImageChannelSettings()
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
        if (!this.HasProp("__IMiracastReceiverMediaSourceCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverMediaSourceCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverMediaSourceCreatedEventArgs := IMiracastReceiverMediaSourceCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverMediaSourceCreatedEventArgs.get_Connection()
    }

    /**
     * 
     * @returns {MediaSource} 
     */
    get_MediaSource() {
        if (!this.HasProp("__IMiracastReceiverMediaSourceCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverMediaSourceCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverMediaSourceCreatedEventArgs := IMiracastReceiverMediaSourceCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverMediaSourceCreatedEventArgs.get_MediaSource()
    }

    /**
     * 
     * @returns {MiracastReceiverCursorImageChannelSettings} 
     */
    get_CursorImageChannelSettings() {
        if (!this.HasProp("__IMiracastReceiverMediaSourceCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverMediaSourceCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverMediaSourceCreatedEventArgs := IMiracastReceiverMediaSourceCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverMediaSourceCreatedEventArgs.get_CursorImageChannelSettings()
    }

    /**
     * Defers completion of the [MiracastReceiverSession.MediaSourceCreated](miracastreceiversession_mediasourcecreated.md) event until Deferral.Complete is invoked.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivermediasourcecreatedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMiracastReceiverMediaSourceCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverMediaSourceCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverMediaSourceCreatedEventArgs := IMiracastReceiverMediaSourceCreatedEventArgs(outPtr)
        }

        return this.__IMiracastReceiverMediaSourceCreatedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}

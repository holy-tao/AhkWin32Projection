#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILoggingSession.ahk
#Include ..\IClosable.ahk
#Include .\ILoggingSessionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the destination of logged messages from [LoggingChannel](loggingchannel.md) instances.
 * @remarks
 * Use the LoggingSession class to log messages and data to an in-memory circular buffer as your app runs. Use the [SaveToFileAsync](loggingsession_savetofileasync_705962807.md) method to save the buffer to a file. You can view the log files by using the Windows Performance Toolkit (WPT) and other utilities like tracerpt.exe.
 * 
 * LoggingSession instances keep logged messages in memory until the [SaveToFileAsync](loggingsession_savetofileasync_705962807.md) method is called. This enables on-demand saving of events until the app saves the in-memory messages.
 * 
 * Add [LoggingChannel](loggingchannel.md) instances to a LoggingSession, and call LoggingSession instance methods to remove channels, dispose, and perform other operations.
 * 
 * LoggingSession records the most recent 260KB of events, after which it will begin overwriting older events.
 * 
 * You cannot have more than one session with the same name. In addition, each app is limited to 4 sessions total.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoggingSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoggingSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [LoggingSession](loggingsession.md) class.
     * @param {HSTRING} name The name of the logging session.
     * @returns {LoggingSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.#ctor
     */
    static Create(name) {
        if (!LoggingSession.HasProp("__ILoggingSessionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.LoggingSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoggingSessionFactory.IID)
            LoggingSession.__ILoggingSessionFactory := ILoggingSessionFactory(factoryPtr)
        }

        return LoggingSession.__ILoggingSessionFactory.Create(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the logging session.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ILoggingSession")) {
            if ((queryResult := this.QueryInterface(ILoggingSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingSession := ILoggingSession(outPtr)
        }

        return this.__ILoggingSession.get_Name()
    }

    /**
     * Saves the current logging session to a file.
     * @param {IStorageFolder} folder_ The folder that contains the log file.
     * @param {HSTRING} fileName The name of the log file.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.savetofileasync
     */
    SaveToFileAsync(folder_, fileName) {
        if (!this.HasProp("__ILoggingSession")) {
            if ((queryResult := this.QueryInterface(ILoggingSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingSession := ILoggingSession(outPtr)
        }

        return this.__ILoggingSession.SaveToFileAsync(folder_, fileName)
    }

    /**
     * Adds a logging channel to the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.addloggingchannel
     */
    AddLoggingChannel(loggingChannel_) {
        if (!this.HasProp("__ILoggingSession")) {
            if ((queryResult := this.QueryInterface(ILoggingSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingSession := ILoggingSession(outPtr)
        }

        return this.__ILoggingSession.AddLoggingChannel(loggingChannel_)
    }

    /**
     * Adds a logging channel with the specified logging level to the current logging session.
     * @remarks
     * You can also use this function to change the level at which a channel is added to a session; to do so, call **AddLoggingChannel**, using the existing logging channel, but with the updated level.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to add.
     * @param {Integer} maxLevel The logging level for *loggingChannel*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.addloggingchannel
     */
    AddLoggingChannelWithLevel(loggingChannel_, maxLevel) {
        if (!this.HasProp("__ILoggingSession")) {
            if ((queryResult := this.QueryInterface(ILoggingSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingSession := ILoggingSession(outPtr)
        }

        return this.__ILoggingSession.AddLoggingChannelWithLevel(loggingChannel_, maxLevel)
    }

    /**
     * Removes the specified logging channel from the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.removeloggingchannel
     */
    RemoveLoggingChannel(loggingChannel_) {
        if (!this.HasProp("__ILoggingSession")) {
            if ((queryResult := this.QueryInterface(ILoggingSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingSession := ILoggingSession(outPtr)
        }

        return this.__ILoggingSession.RemoveLoggingChannel(loggingChannel_)
    }

    /**
     * Ends the current logging session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingsession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}

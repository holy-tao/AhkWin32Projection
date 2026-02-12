#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\IAsyncOperation.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the destination of logged messages from [LoggingChannel](loggingchannel.md) instances.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ifileloggingsession
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IFileLoggingSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileLoggingSession
     * @type {Guid}
     */
    static IID => Guid("{24c74216-fed2-404c-895f-1f9699cb02f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "AddLoggingChannel", "AddLoggingChannelWithLevel", "RemoveLoggingChannel", "CloseAndSaveToFileAsync", "add_LogFileGenerated", "remove_LogFileGenerated"]

    /**
     * Gets the name of the logging session.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ifileloggingsession.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Adds a logging channel to the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ifileloggingsession.addloggingchannel
     */
    AddLoggingChannel(loggingChannel_) {
        result := ComCall(7, this, "ptr", loggingChannel_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a logging channel with the specified logging level to the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to add.
     * @param {Integer} maxLevel The logging level for *loggingChannel*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ifileloggingsession.addloggingchannel
     */
    AddLoggingChannelWithLevel(loggingChannel_, maxLevel) {
        result := ComCall(8, this, "ptr", loggingChannel_, "int", maxLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the specified logging channel from the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ifileloggingsession.removeloggingchannel
     */
    RemoveLoggingChannel(loggingChannel_) {
        result := ComCall(9, this, "ptr", loggingChannel_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ends the current logging session and saves it to a file.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ifileloggingsession.closeandsavetofileasync
     */
    CloseAndSaveToFileAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<IFileLoggingSession, LogFileGeneratedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LogFileGenerated(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LogFileGenerated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\IAsyncOperation.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the destination of logged messages from [LoggingChannel](loggingchannel.md) instances.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingsession
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingSession
     * @type {Guid}
     */
    static IID => Guid("{6221f306-9380-4ad7-baf5-41ea9310d768}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "SaveToFileAsync", "AddLoggingChannel", "AddLoggingChannelWithLevel", "RemoveLoggingChannel"]

    /**
     * Gets the name of the logging session.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingsession.name
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
     * Save the current logging session to a file.
     * @param {IStorageFolder} folder_ The folder to save the log file in.
     * @param {HSTRING} fileName The name of the file.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingsession.savetofileasync
     */
    SaveToFileAsync(folder_, fileName) {
        if(fileName is String) {
            pin := HSTRING.Create(fileName)
            fileName := pin.Value
        }
        fileName := fileName is Win32Handle ? NumGet(fileName, "ptr") : fileName

        result := ComCall(7, this, "ptr", folder_, "ptr", fileName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Adds a logging channel to the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to add.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingsession.addloggingchannel
     */
    AddLoggingChannel(loggingChannel_) {
        result := ComCall(8, this, "ptr", loggingChannel_, "int")
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
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingsession.addloggingchannel
     */
    AddLoggingChannelWithLevel(loggingChannel_, maxLevel) {
        result := ComCall(9, this, "ptr", loggingChannel_, "int", maxLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the specified logging channel from the current logging session.
     * @param {ILoggingChannel} loggingChannel_ The logging channel to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingsession.removeloggingchannel
     */
    RemoveLoggingChannel(loggingChannel_) {
        result := ComCall(10, this, "ptr", loggingChannel_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

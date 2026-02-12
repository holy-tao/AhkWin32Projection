#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorageProviderQueryResultSet.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is implemented by a cloud files provider to enable the system to search for files and folders in the provider's sync root.
  * 
  * > [!NOTE]
  * > Cloud files search is supported in Windows 11, version 24H2 and later on [Copilot+ PCs](https://www.microsoft.com/windows/copilot-plus-pcs) or [AI-enabled Cloud PCs](/windows-365/enterprise/ai-enabled-cloud-pcs).
 * @remarks
 * The search operation runs in the cloud files provider process.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersearchhandler
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSearchHandler extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSearchHandler
     * @type {Guid}
     */
    static IID => Guid("{69cc977d-adad-59c9-8fd1-f30b6fae0fd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Find", "ReportUsage"]

    /**
     * Executes the query given the parameters in the option object and returns a result set.
     * @remarks
     * This is a blocking call and should not be called on a UI thread.
     * @param {StorageProviderSearchQueryOptions} options The search query options.
     * @returns {StorageProviderQueryResultSet} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersearchhandler.find
     */
    Find(options) {
        result := ComCall(6, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderQueryResultSet(result_)
    }

    /**
     * This method is called by the UI to report usage of search result when the file is launched.
     * @remarks
     * This is a blocking call and should not be called on a UI thread.
     * @param {Integer} resultUsageKind The kind of usage.
     * @param {HSTRING} remoteFileId The remote ID of the file or folder.
     * @param {HSTRING} resultId The ID of the search result.
     * @param {TimeSpan} latency The time taken to access the file or folder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersearchhandler.reportusage
     */
    ReportUsage(resultUsageKind, remoteFileId, resultId, latency) {
        if(remoteFileId is String) {
            pin := HSTRING.Create(remoteFileId)
            remoteFileId := pin.Value
        }
        remoteFileId := remoteFileId is Win32Handle ? NumGet(remoteFileId, "ptr") : remoteFileId
        if(resultId is String) {
            pin := HSTRING.Create(resultId)
            resultId := pin.Value
        }
        resultId := resultId is Win32Handle ? NumGet(resultId, "ptr") : resultId

        result := ComCall(7, this, "int", resultUsageKind, "ptr", remoteFileId, "ptr", resultId, "ptr", latency, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

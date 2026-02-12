#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DownloadOperation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundDownloader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundDownloader
     * @type {Guid}
     */
    static IID => Guid("{c1c79333-6649-4b1d-a826-a4b3dd234d0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDownload", "CreateDownloadFromFile", "CreateDownloadAsync"]

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IStorageFile} resultFile 
     * @returns {DownloadOperation} 
     */
    CreateDownload(uri_, resultFile) {
        result := ComCall(6, this, "ptr", uri_, "ptr", resultFile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DownloadOperation(operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IStorageFile} resultFile 
     * @param {IStorageFile} requestBodyFile 
     * @returns {DownloadOperation} 
     */
    CreateDownloadFromFile(uri_, resultFile, requestBodyFile) {
        result := ComCall(7, this, "ptr", uri_, "ptr", resultFile, "ptr", requestBodyFile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DownloadOperation(operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IStorageFile} resultFile 
     * @param {IInputStream} requestBodyStream 
     * @returns {IAsyncOperation<DownloadOperation>} 
     */
    CreateDownloadAsync(uri_, resultFile, requestBodyStream) {
        result := ComCall(8, this, "ptr", uri_, "ptr", resultFile, "ptr", requestBodyStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DownloadOperation, operation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UnconstrainedTransferRequestResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundDownloaderUserConsent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundDownloaderUserConsent
     * @type {Guid}
     */
    static IID => Guid("{5d14e906-9266-4808-bd71-5925f2a3130a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestUnconstrainedDownloadsAsync"]

    /**
     * 
     * @param {IIterable<DownloadOperation>} operations 
     * @returns {IAsyncOperation<UnconstrainedTransferRequestResult>} 
     */
    RequestUnconstrainedDownloadsAsync(operations) {
        result := ComCall(6, this, "ptr", operations, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UnconstrainedTransferRequestResult, operation)
    }
}

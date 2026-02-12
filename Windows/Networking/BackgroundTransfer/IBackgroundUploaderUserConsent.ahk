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
class IBackgroundUploaderUserConsent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundUploaderUserConsent
     * @type {Guid}
     */
    static IID => Guid("{3bb384cb-0760-461d-907f-5138f84d44c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestUnconstrainedUploadsAsync"]

    /**
     * 
     * @param {IIterable<UploadOperation>} operations 
     * @returns {IAsyncOperation<UnconstrainedTransferRequestResult>} 
     */
    RequestUnconstrainedUploadsAsync(operations) {
        result := ComCall(6, this, "ptr", operations, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UnconstrainedTransferRequestResult, operation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UploadOperation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundUploader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundUploader
     * @type {Guid}
     */
    static IID => Guid("{c595c9ae-cead-465b-8801-c55ac90a01ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUpload", "CreateUploadFromStreamAsync", "CreateUploadWithFormDataAndAutoBoundaryAsync", "CreateUploadWithSubTypeAsync", "CreateUploadWithSubTypeAndBoundaryAsync"]

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IStorageFile} sourceFile_ 
     * @returns {UploadOperation} 
     */
    CreateUpload(uri_, sourceFile_) {
        result := ComCall(6, this, "ptr", uri_, "ptr", sourceFile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UploadOperation(operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IInputStream} sourceStream 
     * @returns {IAsyncOperation<UploadOperation>} 
     */
    CreateUploadFromStreamAsync(uri_, sourceStream) {
        result := ComCall(7, this, "ptr", uri_, "ptr", sourceStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UploadOperation, operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IIterable<BackgroundTransferContentPart>} parts 
     * @returns {IAsyncOperation<UploadOperation>} 
     */
    CreateUploadWithFormDataAndAutoBoundaryAsync(uri_, parts) {
        result := ComCall(8, this, "ptr", uri_, "ptr", parts, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UploadOperation, operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IIterable<BackgroundTransferContentPart>} parts 
     * @param {HSTRING} subType 
     * @returns {IAsyncOperation<UploadOperation>} 
     */
    CreateUploadWithSubTypeAsync(uri_, parts, subType) {
        if(subType is String) {
            pin := HSTRING.Create(subType)
            subType := pin.Value
        }
        subType := subType is Win32Handle ? NumGet(subType, "ptr") : subType

        result := ComCall(9, this, "ptr", uri_, "ptr", parts, "ptr", subType, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UploadOperation, operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IIterable<BackgroundTransferContentPart>} parts 
     * @param {HSTRING} subType 
     * @param {HSTRING} boundary 
     * @returns {IAsyncOperation<UploadOperation>} 
     */
    CreateUploadWithSubTypeAndBoundaryAsync(uri_, parts, subType, boundary) {
        if(subType is String) {
            pin := HSTRING.Create(subType)
            subType := pin.Value
        }
        subType := subType is Win32Handle ? NumGet(subType, "ptr") : subType
        if(boundary is String) {
            pin := HSTRING.Create(boundary)
            boundary := pin.Value
        }
        boundary := boundary is Win32Handle ? NumGet(boundary, "ptr") : boundary

        result := ComCall(10, this, "ptr", uri_, "ptr", parts, "ptr", subType, "ptr", boundary, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UploadOperation, operation)
    }
}

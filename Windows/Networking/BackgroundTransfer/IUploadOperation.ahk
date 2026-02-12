#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\IStorageFile.ahk
#Include .\BackgroundUploadProgress.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\UploadOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IUploadOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUploadOperation
     * @type {Guid}
     */
    static IID => Guid("{3e5624e0-7389-434c-8b35-427fd36bbdae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceFile", "get_Progress", "StartAsync", "AttachAsync"]

    /**
     * @type {IStorageFile} 
     */
    SourceFile {
        get => this.get_SourceFile()
    }

    /**
     * @type {BackgroundUploadProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_SourceFile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFile(value)
    }

    /**
     * 
     * @returns {BackgroundUploadProgress} 
     */
    get_Progress() {
        value := BackgroundUploadProgress()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<UploadOperation, UploadOperation>} 
     */
    StartAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(UploadOperation, UploadOperation, operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<UploadOperation, UploadOperation>} 
     */
    AttachAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(UploadOperation, UploadOperation, operation)
    }
}

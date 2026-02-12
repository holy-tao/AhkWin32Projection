#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\IStorageFile.ahk
#Include .\BackgroundDownloadProgress.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\DownloadOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IDownloadOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadOperation
     * @type {Guid}
     */
    static IID => Guid("{bd87ebb0-5714-4e09-ba68-bef73903b0d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResultFile", "get_Progress", "StartAsync", "AttachAsync", "Pause", "Resume"]

    /**
     * @type {IStorageFile} 
     */
    ResultFile {
        get => this.get_ResultFile()
    }

    /**
     * @type {BackgroundDownloadProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_ResultFile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFile(value)
    }

    /**
     * 
     * @returns {BackgroundDownloadProgress} 
     */
    get_Progress() {
        value := BackgroundDownloadProgress()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<DownloadOperation, DownloadOperation>} 
     */
    StartAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DownloadOperation, DownloadOperation, operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<DownloadOperation, DownloadOperation>} 
     */
    AttachAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(DownloadOperation, DownloadOperation, operation)
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

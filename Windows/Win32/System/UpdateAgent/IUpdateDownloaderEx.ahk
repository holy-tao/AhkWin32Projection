#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDownloadJob.ahk
#Include .\IDownloadResult.ahk
#Include .\IUpdateDownloader.ahk

/**
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateDownloaderEx extends IUpdateDownloader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateDownloaderEx
     * @type {Guid}
     */
    static IID => Guid("{94726306-f12a-482a-a774-fb4f870d98c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginDownload2", "Download2"]

    /**
     * 
     * @param {Integer} downloadType 
     * @param {IUnknown} onProgressChanged 
     * @param {IUnknown} onCompleted 
     * @param {VARIANT} state 
     * @returns {IDownloadJob} 
     */
    BeginDownload2(downloadType, onProgressChanged, onCompleted, state) {
        result := ComCall(18, this, "int", downloadType, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return IDownloadJob(retval)
    }

    /**
     * 
     * @param {Integer} downloadType 
     * @returns {IDownloadResult} 
     */
    Download2(downloadType) {
        result := ComCall(19, this, "int", downloadType, "ptr*", &retval := 0, "HRESULT")
        return IDownloadResult(retval)
    }
}

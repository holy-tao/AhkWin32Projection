#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IBackgroundCopyCallback1 interface to receive notification when events occur.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ibackgroundcopycallback1
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyCallback1 extends IUnknown{
    /**
     * The interface identifier for IBackgroundCopyCallback1
     * @type {Guid}
     */
    static IID => Guid("{084f6593-3800-4e08-9b59-99fa59addf82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IBackgroundCopyGroup>} pGroup 
     * @param {Pointer<IBackgroundCopyJob1>} pJob 
     * @param {Integer} dwFileIndex 
     * @param {Integer} dwStatus 
     * @param {Integer} dwNumOfRetries 
     * @param {Integer} dwWin32Result 
     * @param {Integer} dwTransportResult 
     * @returns {HRESULT} 
     */
    OnStatus(pGroup, pJob, dwFileIndex, dwStatus, dwNumOfRetries, dwWin32Result, dwTransportResult) {
        result := ComCall(3, this, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwStatus, "uint", dwNumOfRetries, "uint", dwWin32Result, "uint", dwTransportResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProgressType 
     * @param {Pointer<IBackgroundCopyGroup>} pGroup 
     * @param {Pointer<IBackgroundCopyJob1>} pJob 
     * @param {Integer} dwFileIndex 
     * @param {Integer} dwProgressValue 
     * @returns {HRESULT} 
     */
    OnProgress(ProgressType, pGroup, pJob, dwFileIndex, dwProgressValue) {
        result := ComCall(4, this, "uint", ProgressType, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwProgressValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProgressType 
     * @param {Pointer<IBackgroundCopyGroup>} pGroup 
     * @param {Pointer<IBackgroundCopyJob1>} pJob 
     * @param {Integer} dwFileIndex 
     * @param {Integer} dwProgressValue 
     * @param {Integer} dwByteArraySize 
     * @param {Pointer<Byte>} pByte 
     * @returns {HRESULT} 
     */
    OnProgressEx(ProgressType, pGroup, pJob, dwFileIndex, dwProgressValue, dwByteArraySize, pByte) {
        result := ComCall(5, this, "uint", ProgressType, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwProgressValue, "uint", dwByteArraySize, "char*", pByte, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

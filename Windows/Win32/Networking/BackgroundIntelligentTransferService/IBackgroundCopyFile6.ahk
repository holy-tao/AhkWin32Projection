#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile5.ahk

/**
 * Use this interface to request file ranges for On Demand download jobs.
 * @remarks
 * 
  * To get an <b>IBackgroundCopyFile6</b> interface    pointer, call the <b>IBackgroundCopyFile::QueryInterface</b> method using "__uuidof(IBackgroundCopyFile6)" for the interface identifier.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits10_1/nn-bits10_1-ibackgroundcopyfile6
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile6 extends IBackgroundCopyFile5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyFile6
     * @type {Guid}
     */
    static IID => Guid("{cf6784f7-d677-49fd-9368-cb47aee9d1ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateDownloadPosition", "RequestFileRanges", "GetFilledFileRanges"]

    /**
     * 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-updatedownloadposition
     */
    UpdateDownloadPosition(offset) {
        result := ComCall(15, this, "uint", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rangeCount 
     * @param {Pointer<BG_FILE_RANGE>} ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-requestfileranges
     */
    RequestFileRanges(rangeCount, ranges) {
        result := ComCall(16, this, "uint", rangeCount, "ptr", ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} rangeCount 
     * @param {Pointer<Pointer<BG_FILE_RANGE>>} ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_1/nf-bits10_1-ibackgroundcopyfile6-getfilledfileranges
     */
    GetFilledFileRanges(rangeCount, ranges) {
        rangeCountMarshal := rangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, rangeCountMarshal, rangeCount, "ptr*", ranges, "HRESULT")
        return result
    }
}

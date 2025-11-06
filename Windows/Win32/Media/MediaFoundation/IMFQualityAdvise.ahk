#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the quality manager to adjust the audio or video quality of a component in the pipeline.
 * @remarks
 * 
  * The quality manager typically obtains this interface when the quality manager's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualitymanager-notifytopology">IMFQualityManager::NotifyTopology</a> method is called.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfqualityadvise
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFQualityAdvise extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFQualityAdvise
     * @type {Guid}
     */
    static IID => Guid("{ec15e2e9-e36b-4f7c-8758-77d452ef4ce7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDropMode", "SetQualityLevel", "GetDropMode", "GetQualityLevel", "DropTime"]

    /**
     * 
     * @param {Integer} eDropMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-setdropmode
     */
    SetDropMode(eDropMode) {
        result := ComCall(3, this, "int", eDropMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eQualityLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-setqualitylevel
     */
    SetQualityLevel(eQualityLevel) {
        result := ComCall(4, this, "int", eQualityLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-getdropmode
     */
    GetDropMode() {
        result := ComCall(5, this, "int*", &peDropMode := 0, "HRESULT")
        return peDropMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-getqualitylevel
     */
    GetQualityLevel() {
        result := ComCall(6, this, "int*", &peQualityLevel := 0, "HRESULT")
        return peQualityLevel
    }

    /**
     * 
     * @param {Integer} hnsAmountToDrop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-droptime
     */
    DropTime(hnsAmountToDrop) {
        result := ComCall(7, this, "int64", hnsAmountToDrop, "HRESULT")
        return result
    }
}

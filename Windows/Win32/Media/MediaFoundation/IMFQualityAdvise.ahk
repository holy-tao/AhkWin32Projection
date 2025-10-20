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
     * 
     * @param {Integer} eDropMode 
     * @returns {HRESULT} 
     */
    SetDropMode(eDropMode) {
        result := ComCall(3, this, "int", eDropMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eQualityLevel 
     * @returns {HRESULT} 
     */
    SetQualityLevel(eQualityLevel) {
        result := ComCall(4, this, "int", eQualityLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peDropMode 
     * @returns {HRESULT} 
     */
    GetDropMode(peDropMode) {
        result := ComCall(5, this, "int*", peDropMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peQualityLevel 
     * @returns {HRESULT} 
     */
    GetQualityLevel(peQualityLevel) {
        result := ComCall(6, this, "int*", peQualityLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsAmountToDrop 
     * @returns {HRESULT} 
     */
    DropTime(hnsAmountToDrop) {
        result := ComCall(7, this, "int64", hnsAmountToDrop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

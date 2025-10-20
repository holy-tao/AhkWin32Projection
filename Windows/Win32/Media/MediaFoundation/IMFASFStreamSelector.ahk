#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Selects streams in an Advanced Systems Format (ASF) file, based on the mutual exclusion information in the ASF header.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfstreamselector
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFStreamSelector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFStreamSelector
     * @type {Guid}
     */
    static IID => Guid("{d01bad4a-4fa0-4a60-9349-c27e62da9d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetOutputCount", "GetOutputStreamCount", "GetOutputStreamNumbers", "GetOutputFromStream", "GetOutputOverride", "SetOutputOverride", "GetOutputMutexCount", "GetOutputMutex", "SetOutputMutexSelection", "GetBandwidthStepCount", "GetBandwidthStep", "BitrateToStepNumber", "SetStreamSelectorFlags"]

    /**
     * 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getstreamcount
     */
    GetStreamCount(pcStreams) {
        result := ComCall(3, this, "uint*", pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcOutputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputcount
     */
    GetOutputCount(pcOutputs) {
        result := ComCall(4, this, "uint*", pcOutputs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamcount
     */
    GetOutputStreamCount(dwOutputNum, pcStreams) {
        result := ComCall(5, this, "uint", dwOutputNum, "uint*", pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<Integer>} rgwStreamNumbers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamnumbers
     */
    GetOutputStreamNumbers(dwOutputNum, rgwStreamNumbers) {
        result := ComCall(6, this, "uint", dwOutputNum, "ushort*", rgwStreamNumbers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Integer>} pdwOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputfromstream
     */
    GetOutputFromStream(wStreamNum, pdwOutput) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint*", pdwOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<Integer>} pSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputoverride
     */
    GetOutputOverride(dwOutputNum, pSelection) {
        result := ComCall(8, this, "uint", dwOutputNum, "int*", pSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} Selection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-setoutputoverride
     */
    SetOutputOverride(dwOutputNum, Selection) {
        result := ComCall(9, this, "uint", dwOutputNum, "int", Selection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<Integer>} pcMutexes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutexcount
     */
    GetOutputMutexCount(dwOutputNum, pcMutexes) {
        result := ComCall(10, this, "uint", dwOutputNum, "uint*", pcMutexes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwMutexNum 
     * @param {Pointer<IUnknown>} ppMutex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutex
     */
    GetOutputMutex(dwOutputNum, dwMutexNum, ppMutex) {
        result := ComCall(11, this, "uint", dwOutputNum, "uint", dwMutexNum, "ptr*", ppMutex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwMutexNum 
     * @param {Integer} wSelectedRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-setoutputmutexselection
     */
    SetOutputMutexSelection(dwOutputNum, dwMutexNum, wSelectedRecord) {
        result := ComCall(12, this, "uint", dwOutputNum, "uint", dwMutexNum, "ushort", wSelectedRecord, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcStepCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstepcount
     */
    GetBandwidthStepCount(pcStepCount) {
        result := ComCall(13, this, "uint*", pcStepCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStepNum 
     * @param {Pointer<Integer>} pdwBitrate 
     * @param {Pointer<Integer>} rgwStreamNumbers 
     * @param {Pointer<Integer>} rgSelections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstep
     */
    GetBandwidthStep(dwStepNum, pdwBitrate, rgwStreamNumbers, rgSelections) {
        result := ComCall(14, this, "uint", dwStepNum, "uint*", pdwBitrate, "ushort*", rgwStreamNumbers, "int*", rgSelections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBitrate 
     * @param {Pointer<Integer>} pdwStepNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-bitratetostepnumber
     */
    BitrateToStepNumber(dwBitrate, pdwStepNum) {
        result := ComCall(15, this, "uint", dwBitrate, "uint*", pdwStepNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSelectorFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-setstreamselectorflags
     */
    SetStreamSelectorFlags(dwStreamSelectorFlags) {
        result := ComCall(16, this, "uint", dwStreamSelectorFlags, "HRESULT")
        return result
    }
}

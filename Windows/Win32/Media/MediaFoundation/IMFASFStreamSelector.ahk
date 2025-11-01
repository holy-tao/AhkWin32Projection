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
        pcStreamsMarshal := pcStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcStreamsMarshal, pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcOutputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputcount
     */
    GetOutputCount(pcOutputs) {
        pcOutputsMarshal := pcOutputs is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcOutputsMarshal, pcOutputs, "HRESULT")
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
        pcStreamsMarshal := pcStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwOutputNum, pcStreamsMarshal, pcStreams, "HRESULT")
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
        rgwStreamNumbersMarshal := rgwStreamNumbers is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "uint", dwOutputNum, rgwStreamNumbersMarshal, rgwStreamNumbers, "HRESULT")
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
        pdwOutputMarshal := pdwOutput is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ushort", wStreamNum, pdwOutputMarshal, pdwOutput, "HRESULT")
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
        pSelectionMarshal := pSelection is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "uint", dwOutputNum, pSelectionMarshal, pSelection, "HRESULT")
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
        pcMutexesMarshal := pcMutexes is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", dwOutputNum, pcMutexesMarshal, pcMutexes, "HRESULT")
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
        pcStepCountMarshal := pcStepCount is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pcStepCountMarshal, pcStepCount, "HRESULT")
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
        pdwBitrateMarshal := pdwBitrate is VarRef ? "uint*" : "ptr"
        rgwStreamNumbersMarshal := rgwStreamNumbers is VarRef ? "ushort*" : "ptr"
        rgSelectionsMarshal := rgSelections is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "uint", dwStepNum, pdwBitrateMarshal, pdwBitrate, rgwStreamNumbersMarshal, rgwStreamNumbers, rgSelectionsMarshal, rgSelections, "HRESULT")
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
        pdwStepNumMarshal := pdwStepNum is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwBitrate, pdwStepNumMarshal, pdwStepNum, "HRESULT")
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

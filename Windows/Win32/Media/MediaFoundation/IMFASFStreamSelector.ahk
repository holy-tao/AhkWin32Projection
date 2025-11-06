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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(3, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputcount
     */
    GetOutputCount() {
        result := ComCall(4, this, "uint*", &pcOutputs := 0, "HRESULT")
        return pcOutputs
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamcount
     */
    GetOutputStreamCount(dwOutputNum) {
        result := ComCall(5, this, "uint", dwOutputNum, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputstreamnumbers
     */
    GetOutputStreamNumbers(dwOutputNum) {
        result := ComCall(6, this, "uint", dwOutputNum, "ushort*", &rgwStreamNumbers := 0, "HRESULT")
        return rgwStreamNumbers
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputfromstream
     */
    GetOutputFromStream(wStreamNum) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint*", &pdwOutput := 0, "HRESULT")
        return pdwOutput
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputoverride
     */
    GetOutputOverride(dwOutputNum) {
        result := ComCall(8, this, "uint", dwOutputNum, "int*", &pSelection := 0, "HRESULT")
        return pSelection
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutexcount
     */
    GetOutputMutexCount(dwOutputNum) {
        result := ComCall(10, this, "uint", dwOutputNum, "uint*", &pcMutexes := 0, "HRESULT")
        return pcMutexes
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwMutexNum 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getoutputmutex
     */
    GetOutputMutex(dwOutputNum, dwMutexNum) {
        result := ComCall(11, this, "uint", dwOutputNum, "uint", dwMutexNum, "ptr*", &ppMutex := 0, "HRESULT")
        return IUnknown(ppMutex)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-getbandwidthstepcount
     */
    GetBandwidthStepCount() {
        result := ComCall(13, this, "uint*", &pcStepCount := 0, "HRESULT")
        return pcStepCount
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamselector-bitratetostepnumber
     */
    BitrateToStepNumber(dwBitrate) {
        result := ComCall(15, this, "uint", dwBitrate, "uint*", &pdwStepNum := 0, "HRESULT")
        return pdwStepNum
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

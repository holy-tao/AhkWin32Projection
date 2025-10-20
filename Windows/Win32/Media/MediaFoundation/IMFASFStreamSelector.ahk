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
     * 
     * @param {Pointer<UInt32>} pcStreams 
     * @returns {HRESULT} 
     */
    GetStreamCount(pcStreams) {
        result := ComCall(3, this, "uint*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcOutputs 
     * @returns {HRESULT} 
     */
    GetOutputCount(pcOutputs) {
        result := ComCall(4, this, "uint*", pcOutputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<UInt32>} pcStreams 
     * @returns {HRESULT} 
     */
    GetOutputStreamCount(dwOutputNum, pcStreams) {
        result := ComCall(5, this, "uint", dwOutputNum, "uint*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<UInt16>} rgwStreamNumbers 
     * @returns {HRESULT} 
     */
    GetOutputStreamNumbers(dwOutputNum, rgwStreamNumbers) {
        result := ComCall(6, this, "uint", dwOutputNum, "ushort*", rgwStreamNumbers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<UInt32>} pdwOutput 
     * @returns {HRESULT} 
     */
    GetOutputFromStream(wStreamNum, pdwOutput) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint*", pdwOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<Int32>} pSelection 
     * @returns {HRESULT} 
     */
    GetOutputOverride(dwOutputNum, pSelection) {
        result := ComCall(8, this, "uint", dwOutputNum, "int*", pSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} Selection 
     * @returns {HRESULT} 
     */
    SetOutputOverride(dwOutputNum, Selection) {
        result := ComCall(9, this, "uint", dwOutputNum, "int", Selection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<UInt32>} pcMutexes 
     * @returns {HRESULT} 
     */
    GetOutputMutexCount(dwOutputNum, pcMutexes) {
        result := ComCall(10, this, "uint", dwOutputNum, "uint*", pcMutexes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwMutexNum 
     * @param {Pointer<IUnknown>} ppMutex 
     * @returns {HRESULT} 
     */
    GetOutputMutex(dwOutputNum, dwMutexNum, ppMutex) {
        result := ComCall(11, this, "uint", dwOutputNum, "uint", dwMutexNum, "ptr", ppMutex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwMutexNum 
     * @param {Integer} wSelectedRecord 
     * @returns {HRESULT} 
     */
    SetOutputMutexSelection(dwOutputNum, dwMutexNum, wSelectedRecord) {
        result := ComCall(12, this, "uint", dwOutputNum, "uint", dwMutexNum, "ushort", wSelectedRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcStepCount 
     * @returns {HRESULT} 
     */
    GetBandwidthStepCount(pcStepCount) {
        result := ComCall(13, this, "uint*", pcStepCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStepNum 
     * @param {Pointer<UInt32>} pdwBitrate 
     * @param {Pointer<UInt16>} rgwStreamNumbers 
     * @param {Pointer<Int32>} rgSelections 
     * @returns {HRESULT} 
     */
    GetBandwidthStep(dwStepNum, pdwBitrate, rgwStreamNumbers, rgSelections) {
        result := ComCall(14, this, "uint", dwStepNum, "uint*", pdwBitrate, "ushort*", rgwStreamNumbers, "int*", rgSelections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBitrate 
     * @param {Pointer<UInt32>} pdwStepNum 
     * @returns {HRESULT} 
     */
    BitrateToStepNumber(dwBitrate, pdwStepNum) {
        result := ComCall(15, this, "uint", dwBitrate, "uint*", pdwStepNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamSelectorFlags 
     * @returns {HRESULT} 
     */
    SetStreamSelectorFlags(dwStreamSelectorFlags) {
        result := ComCall(16, this, "uint", dwStreamSelectorFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

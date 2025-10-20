#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A call to QueryInterface from a reader object exposes the advanced functionality described in this section.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced extends IUnknown{
    /**
     * The interface identifier for IWMReaderAdvanced
     * @type {Guid}
     */
    static IID => Guid("{96406bea-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fUserClock 
     * @returns {HRESULT} 
     */
    SetUserProvidedClock(fUserClock) {
        result := ComCall(3, this, "int", fUserClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUserClock 
     * @returns {HRESULT} 
     */
    GetUserProvidedClock(pfUserClock) {
        result := ComCall(4, this, "ptr", pfUserClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsTime 
     * @returns {HRESULT} 
     */
    DeliverTime(cnsTime) {
        result := ComCall(5, this, "uint", cnsTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fSelection 
     * @returns {HRESULT} 
     */
    SetManualStreamSelection(fSelection) {
        result := ComCall(6, this, "int", fSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSelection 
     * @returns {HRESULT} 
     */
    GetManualStreamSelection(pfSelection) {
        result := ComCall(7, this, "ptr", pfSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cStreamCount 
     * @param {Pointer<UInt16>} pwStreamNumbers 
     * @param {Pointer<Int32>} pSelections 
     * @returns {HRESULT} 
     */
    SetStreamsSelected(cStreamCount, pwStreamNumbers, pSelections) {
        result := ComCall(8, this, "ushort", cStreamCount, "ushort*", pwStreamNumbers, "int*", pSelections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Int32>} pSelection 
     * @returns {HRESULT} 
     */
    GetStreamSelected(wStreamNum, pSelection) {
        result := ComCall(9, this, "ushort", wStreamNum, "int*", pSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fGetCallbacks 
     * @returns {HRESULT} 
     */
    SetReceiveSelectionCallbacks(fGetCallbacks) {
        result := ComCall(10, this, "int", fGetCallbacks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfGetCallbacks 
     * @returns {HRESULT} 
     */
    GetReceiveSelectionCallbacks(pfGetCallbacks) {
        result := ComCall(11, this, "ptr", pfGetCallbacks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fReceiveStreamSamples 
     * @returns {HRESULT} 
     */
    SetReceiveStreamSamples(wStreamNum, fReceiveStreamSamples) {
        result := ComCall(12, this, "ushort", wStreamNum, "int", fReceiveStreamSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<BOOL>} pfReceiveStreamSamples 
     * @returns {HRESULT} 
     */
    GetReceiveStreamSamples(wStreamNum, pfReceiveStreamSamples) {
        result := ComCall(13, this, "ushort", wStreamNum, "ptr", pfReceiveStreamSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {BOOL} fAllocate 
     * @returns {HRESULT} 
     */
    SetAllocateForOutput(dwOutputNum, fAllocate) {
        result := ComCall(14, this, "uint", dwOutputNum, "int", fAllocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<BOOL>} pfAllocate 
     * @returns {HRESULT} 
     */
    GetAllocateForOutput(dwOutputNum, pfAllocate) {
        result := ComCall(15, this, "uint", dwOutputNum, "ptr", pfAllocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fAllocate 
     * @returns {HRESULT} 
     */
    SetAllocateForStream(wStreamNum, fAllocate) {
        result := ComCall(16, this, "ushort", wStreamNum, "int", fAllocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSreamNum 
     * @param {Pointer<BOOL>} pfAllocate 
     * @returns {HRESULT} 
     */
    GetAllocateForStream(dwSreamNum, pfAllocate) {
        result := ComCall(17, this, "ushort", dwSreamNum, "ptr", pfAllocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_READER_STATISTICS>} pStatistics 
     * @returns {HRESULT} 
     */
    GetStatistics(pStatistics) {
        result := ComCall(18, this, "ptr", pStatistics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_READER_CLIENTINFO>} pClientInfo 
     * @returns {HRESULT} 
     */
    SetClientInfo(pClientInfo) {
        result := ComCall(19, this, "ptr", pClientInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutput 
     * @param {Pointer<UInt32>} pcbMax 
     * @returns {HRESULT} 
     */
    GetMaxOutputSampleSize(dwOutput, pcbMax) {
        result := ComCall(20, this, "uint", dwOutput, "uint*", pcbMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStream 
     * @param {Pointer<UInt32>} pcbMax 
     * @returns {HRESULT} 
     */
    GetMaxStreamSampleSize(wStream, pcbMax) {
        result := ComCall(21, this, "ushort", wStream, "uint*", pcbMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsLateness 
     * @returns {HRESULT} 
     */
    NotifyLateDelivery(cnsLateness) {
        result := ComCall(22, this, "uint", cnsLateness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

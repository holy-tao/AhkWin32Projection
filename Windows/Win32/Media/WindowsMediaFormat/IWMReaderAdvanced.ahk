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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUserProvidedClock", "GetUserProvidedClock", "DeliverTime", "SetManualStreamSelection", "GetManualStreamSelection", "SetStreamsSelected", "GetStreamSelected", "SetReceiveSelectionCallbacks", "GetReceiveSelectionCallbacks", "SetReceiveStreamSamples", "GetReceiveStreamSamples", "SetAllocateForOutput", "GetAllocateForOutput", "SetAllocateForStream", "GetAllocateForStream", "GetStatistics", "SetClientInfo", "GetMaxOutputSampleSize", "GetMaxStreamSampleSize", "NotifyLateDelivery"]

    /**
     * 
     * @param {BOOL} fUserClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setuserprovidedclock
     */
    SetUserProvidedClock(fUserClock) {
        result := ComCall(3, this, "int", fUserClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUserClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getuserprovidedclock
     */
    GetUserProvidedClock(pfUserClock) {
        result := ComCall(4, this, "ptr", pfUserClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-delivertime
     */
    DeliverTime(cnsTime) {
        result := ComCall(5, this, "uint", cnsTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setmanualstreamselection
     */
    SetManualStreamSelection(fSelection) {
        result := ComCall(6, this, "int", fSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getmanualstreamselection
     */
    GetManualStreamSelection(pfSelection) {
        result := ComCall(7, this, "ptr", pfSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cStreamCount 
     * @param {Pointer<Integer>} pwStreamNumbers 
     * @param {Pointer<Integer>} pSelections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setstreamsselected
     */
    SetStreamsSelected(cStreamCount, pwStreamNumbers, pSelections) {
        result := ComCall(8, this, "ushort", cStreamCount, "ushort*", pwStreamNumbers, "int*", pSelections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Integer>} pSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getstreamselected
     */
    GetStreamSelected(wStreamNum, pSelection) {
        result := ComCall(9, this, "ushort", wStreamNum, "int*", pSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fGetCallbacks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setreceiveselectioncallbacks
     */
    SetReceiveSelectionCallbacks(fGetCallbacks) {
        result := ComCall(10, this, "int", fGetCallbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfGetCallbacks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getreceiveselectioncallbacks
     */
    GetReceiveSelectionCallbacks(pfGetCallbacks) {
        result := ComCall(11, this, "ptr", pfGetCallbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fReceiveStreamSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setreceivestreamsamples
     */
    SetReceiveStreamSamples(wStreamNum, fReceiveStreamSamples) {
        result := ComCall(12, this, "ushort", wStreamNum, "int", fReceiveStreamSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<BOOL>} pfReceiveStreamSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getreceivestreamsamples
     */
    GetReceiveStreamSamples(wStreamNum, pfReceiveStreamSamples) {
        result := ComCall(13, this, "ushort", wStreamNum, "ptr", pfReceiveStreamSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {BOOL} fAllocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setallocateforoutput
     */
    SetAllocateForOutput(dwOutputNum, fAllocate) {
        result := ComCall(14, this, "uint", dwOutputNum, "int", fAllocate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<BOOL>} pfAllocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getallocateforoutput
     */
    GetAllocateForOutput(dwOutputNum, pfAllocate) {
        result := ComCall(15, this, "uint", dwOutputNum, "ptr", pfAllocate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fAllocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setallocateforstream
     */
    SetAllocateForStream(wStreamNum, fAllocate) {
        result := ComCall(16, this, "ushort", wStreamNum, "int", fAllocate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSreamNum 
     * @param {Pointer<BOOL>} pfAllocate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getallocateforstream
     */
    GetAllocateForStream(dwSreamNum, pfAllocate) {
        result := ComCall(17, this, "ushort", dwSreamNum, "ptr", pfAllocate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WM_READER_STATISTICS>} pStatistics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getstatistics
     */
    GetStatistics(pStatistics) {
        result := ComCall(18, this, "ptr", pStatistics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WM_READER_CLIENTINFO>} pClientInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setclientinfo
     */
    SetClientInfo(pClientInfo) {
        result := ComCall(19, this, "ptr", pClientInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutput 
     * @param {Pointer<Integer>} pcbMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getmaxoutputsamplesize
     */
    GetMaxOutputSampleSize(dwOutput, pcbMax) {
        result := ComCall(20, this, "uint", dwOutput, "uint*", pcbMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStream 
     * @param {Pointer<Integer>} pcbMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getmaxstreamsamplesize
     */
    GetMaxStreamSampleSize(wStream, pcbMax) {
        result := ComCall(21, this, "ushort", wStream, "uint*", pcbMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsLateness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-notifylatedelivery
     */
    NotifyLateDelivery(cnsLateness) {
        result := ComCall(22, this, "uint", cnsLateness, "HRESULT")
        return result
    }
}

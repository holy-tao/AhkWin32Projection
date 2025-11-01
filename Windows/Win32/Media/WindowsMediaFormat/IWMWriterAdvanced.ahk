#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterAdvanced interface provides advanced writing functionality.This interface exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriteradvanced
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterAdvanced
     * @type {Guid}
     */
    static IID => Guid("{96406be3-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSinkCount", "GetSink", "AddSink", "RemoveSink", "WriteStreamSample", "SetLiveSource", "IsRealTime", "GetWriterTime", "GetStatistics", "SetSyncTolerance", "GetSyncTolerance"]

    /**
     * 
     * @param {Pointer<Integer>} pcSinks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsinkcount
     */
    GetSinkCount(pcSinks) {
        pcSinksMarshal := pcSinks is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcSinksMarshal, pcSinks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSinkNum 
     * @param {Pointer<IWMWriterSink>} ppSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsink
     */
    GetSink(dwSinkNum, ppSink) {
        result := ComCall(4, this, "uint", dwSinkNum, "ptr*", ppSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMWriterSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-addsink
     */
    AddSink(pSink) {
        result := ComCall(5, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMWriterSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-removesink
     */
    RemoveSink(pSink) {
        result := ComCall(6, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} msSampleSendTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {INSSBuffer} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-writestreamsample
     */
    WriteStreamSample(wStreamNum, cnsSampleTime, msSampleSendTime, cnsSampleDuration, dwFlags, pSample) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint", cnsSampleTime, "uint", msSampleSendTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fIsLiveSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setlivesource
     */
    SetLiveSource(fIsLiveSource) {
        result := ComCall(8, this, "int", fIsLiveSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRealTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-isrealtime
     */
    IsRealTime(pfRealTime) {
        result := ComCall(9, this, "ptr", pfRealTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcnsCurrentTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getwritertime
     */
    GetWriterTime(pcnsCurrentTime) {
        pcnsCurrentTimeMarshal := pcnsCurrentTime is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pcnsCurrentTimeMarshal, pcnsCurrentTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<WM_WRITER_STATISTICS>} pStats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getstatistics
     */
    GetStatistics(wStreamNum, pStats) {
        result := ComCall(11, this, "ushort", wStreamNum, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setsynctolerance
     */
    SetSyncTolerance(msWindow) {
        result := ComCall(12, this, "uint", msWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmsWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsynctolerance
     */
    GetSyncTolerance(pmsWindow) {
        pmsWindowMarshal := pmsWindow is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pmsWindowMarshal, pmsWindow, "HRESULT")
        return result
    }
}

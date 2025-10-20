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
     * 
     * @param {Pointer<UInt32>} pcSinks 
     * @returns {HRESULT} 
     */
    GetSinkCount(pcSinks) {
        result := ComCall(3, this, "uint*", pcSinks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSinkNum 
     * @param {Pointer<IWMWriterSink>} ppSink 
     * @returns {HRESULT} 
     */
    GetSink(dwSinkNum, ppSink) {
        result := ComCall(4, this, "uint", dwSinkNum, "ptr", ppSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMWriterSink>} pSink 
     * @returns {HRESULT} 
     */
    AddSink(pSink) {
        result := ComCall(5, this, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMWriterSink>} pSink 
     * @returns {HRESULT} 
     */
    RemoveSink(pSink) {
        result := ComCall(6, this, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} msSampleSendTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {Pointer<INSSBuffer>} pSample 
     * @returns {HRESULT} 
     */
    WriteStreamSample(wStreamNum, cnsSampleTime, msSampleSendTime, cnsSampleDuration, dwFlags, pSample) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint", cnsSampleTime, "uint", msSampleSendTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fIsLiveSource 
     * @returns {HRESULT} 
     */
    SetLiveSource(fIsLiveSource) {
        result := ComCall(8, this, "int", fIsLiveSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRealTime 
     * @returns {HRESULT} 
     */
    IsRealTime(pfRealTime) {
        result := ComCall(9, this, "ptr", pfRealTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pcnsCurrentTime 
     * @returns {HRESULT} 
     */
    GetWriterTime(pcnsCurrentTime) {
        result := ComCall(10, this, "uint*", pcnsCurrentTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<WM_WRITER_STATISTICS>} pStats 
     * @returns {HRESULT} 
     */
    GetStatistics(wStreamNum, pStats) {
        result := ComCall(11, this, "ushort", wStreamNum, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msWindow 
     * @returns {HRESULT} 
     */
    SetSyncTolerance(msWindow) {
        result := ComCall(12, this, "uint", msWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pmsWindow 
     * @returns {HRESULT} 
     */
    GetSyncTolerance(pmsWindow) {
        result := ComCall(13, this, "uint*", pmsWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

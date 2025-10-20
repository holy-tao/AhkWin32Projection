#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDroppedFrames interface retrieves performance information from a video capture filter, including how many frames were dropped and how many were delivered. Applications can use this interface to determine capture performance at run-time.
 * @remarks
 * 
  * Some filters that expose this interface do not implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamdroppedframes-getdroppedinfo">GetDroppedInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamdroppedframes-getaverageframesize">GetAverageFrameSize</a> method.
  * 
  * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/propsetid-vidcap-droppedframes">PROPSETID_VIDCAP_DROPPEDFRAMES</a> property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
  * 
  * The number of dropped frames is reported by the capture driver. This information is not directly correlated with any particular media sample, so it is not accurate on a per-frame basis, although it should be accurate over time.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdroppedframes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDroppedFrames extends IUnknown{
    /**
     * The interface identifier for IAMDroppedFrames
     * @type {Guid}
     */
    static IID => Guid("{c6e13344-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plDropped 
     * @returns {HRESULT} 
     */
    GetNumDropped(plDropped) {
        result := ComCall(3, this, "int*", plDropped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plNotDropped 
     * @returns {HRESULT} 
     */
    GetNumNotDropped(plNotDropped) {
        result := ComCall(4, this, "int*", plNotDropped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSize 
     * @param {Pointer<Int32>} plArray 
     * @param {Pointer<Int32>} plNumCopied 
     * @returns {HRESULT} 
     */
    GetDroppedInfo(lSize, plArray, plNumCopied) {
        result := ComCall(5, this, "int", lSize, "int*", plArray, "int*", plNumCopied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAverageSize 
     * @returns {HRESULT} 
     */
    GetAverageFrameSize(plAverageSize) {
        result := ComCall(6, this, "int*", plAverageSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

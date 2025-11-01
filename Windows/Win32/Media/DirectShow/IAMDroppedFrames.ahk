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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumDropped", "GetNumNotDropped", "GetDroppedInfo", "GetAverageFrameSize"]

    /**
     * 
     * @param {Pointer<Integer>} plDropped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdroppedframes-getnumdropped
     */
    GetNumDropped(plDropped) {
        plDroppedMarshal := plDropped is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plDroppedMarshal, plDropped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plNotDropped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdroppedframes-getnumnotdropped
     */
    GetNumNotDropped(plNotDropped) {
        plNotDroppedMarshal := plNotDropped is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plNotDroppedMarshal, plNotDropped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSize 
     * @param {Pointer<Integer>} plArray 
     * @param {Pointer<Integer>} plNumCopied 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdroppedframes-getdroppedinfo
     */
    GetDroppedInfo(lSize, plArray, plNumCopied) {
        plArrayMarshal := plArray is VarRef ? "int*" : "ptr"
        plNumCopiedMarshal := plNumCopied is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", lSize, plArrayMarshal, plArray, plNumCopiedMarshal, plNumCopied, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAverageSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdroppedframes-getaverageframesize
     */
    GetAverageFrameSize(plAverageSize) {
        plAverageSizeMarshal := plAverageSize is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plAverageSizeMarshal, plAverageSize, "HRESULT")
        return result
    }
}

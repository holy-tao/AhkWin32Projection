#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAMLatency.ahk

/**
 * The IAMPushSource interface synchronizes a filter graph that renders a live source.
 * @remarks
 * 
  * The Filter Graph Manager uses the methods on this interface to address two problems that commonly occur when rendering live sources:
  * 
  * <ul>
  * <li>Latency: When a filter graph includes more than one live source, the sources often have different latencies, which can cause them to be out of sync. For example, if audio capture has a longer latency time than video capture, the audio will lag behind the video unless the graph compensates for the difference.</li>
  * <li>Rate Matching: When a renderer filter is connected to a live source, it must adjust its data consumption rate to match the source filter's production rate. Otherwise, there might be gaps in the data (if the renderer runs faster than the source) or data might get dropped (if the source runs faster).</li>
  * </ul>
  * To correct for latency, the filter graph calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamlatency-getlatency">IAMLatency::GetLatency</a> on each output pin that exposes the <c>IAMPushSource</c> interface, and determines the maximum latency in the graph. It then calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iampushsource-setstreamoffset">IAMPushSource::SetStreamOffset</a> on any filters with less than the maximum latency, so that they will adjust the time stamps they generate by the correct offset.
  * 
  * To perform rate matching, the filter graph needs to determine whether the renderer filter can match clock rates with the source filter. The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iampushsource-getpushsourceflags">IAMPushSource::GetPushSourceFlags</a> method returns a set of flags indicating whether it is safe for the renderer to match rates with the source.
  * 
  * These issues do not affect capturing to a file. The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/file-writer-filter">File Writer</a> filter relies on time stamps on the incoming samples to write the file correctly; the streams are then synchronized during playback. As for rate matching, the data is always written to the file as fast as possible.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iampushsource
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPushSource extends IAMLatency{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMPushSource
     * @type {Guid}
     */
    static IID => Guid("{f185fe76-e64e-11d2-b76e-00c04fb6bd3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPushSourceFlags", "SetPushSourceFlags", "SetStreamOffset", "GetStreamOffset", "GetMaxStreamOffset", "SetMaxStreamOffset"]

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iampushsource-getpushsourceflags
     */
    GetPushSourceFlags(pFlags) {
        result := ComCall(4, this, "uint*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iampushsource-setpushsourceflags
     */
    SetPushSourceFlags(Flags) {
        result := ComCall(5, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rtOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iampushsource-setstreamoffset
     */
    SetStreamOffset(rtOffset) {
        result := ComCall(6, this, "int64", rtOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prtOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iampushsource-getstreamoffset
     */
    GetStreamOffset(prtOffset) {
        result := ComCall(7, this, "int64*", prtOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prtMaxOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iampushsource-getmaxstreamoffset
     */
    GetMaxStreamOffset(prtMaxOffset) {
        result := ComCall(8, this, "int64*", prtMaxOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rtMaxOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iampushsource-setmaxstreamoffset
     */
    SetMaxStreamOffset(rtMaxOffset) {
        result := ComCall(9, this, "int64", rtMaxOffset, "HRESULT")
        return result
    }
}

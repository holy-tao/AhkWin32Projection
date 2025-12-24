#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMExtendedSeeking interface seeks to a marker in a Windows Media stream or changes the playback rate for a Windows Media file. This interface is implemented by the Windows Media Source filter and the WM ASF Reader filter.
 * @remarks
 * 
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamextendedseeking
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMExtendedSeeking extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMExtendedSeeking
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f9-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExSeekCapabilities", "get_MarkerCount", "get_CurrentMarker", "GetMarkerTime", "GetMarkerName", "put_PlaybackSpeed", "get_PlaybackSpeed"]

    /**
     */
    ExSeekCapabilities {
        get => this.get_ExSeekCapabilities()
    }

    /**
     */
    MarkerCount {
        get => this.get_MarkerCount()
    }

    /**
     */
    CurrentMarker {
        get => this.get_CurrentMarker()
    }

    /**
     */
    PlaybackSpeed {
        get => this.get_PlaybackSpeed()
        set => this.put_PlaybackSpeed(value)
    }

    /**
     * The get_ExSeekCapabilities method retrieves the extended seeking capabilities of the filter.
     * @param {Pointer<Integer>} pExCapabilities Pointer to a variable that receives a bitwise OR of <a href="https://docs.microsoft.com/windows/desktop/api/qnetwork/ne-qnetwork-amextendedseekingcapabilities">AMExtendedSeekingCapabilities</a> flags.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-get_exseekcapabilities
     */
    get_ExSeekCapabilities(pExCapabilities) {
        pExCapabilitiesMarshal := pExCapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pExCapabilitiesMarshal, pExCapabilities, "HRESULT")
        return result
    }

    /**
     * The get_MarkerCount method retrieves the number of markers in the current stream.
     * @param {Pointer<Integer>} pMarkerCount Pointer to a variable that receives the marker count.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-get_markercount
     */
    get_MarkerCount(pMarkerCount) {
        pMarkerCountMarshal := pMarkerCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarkerCountMarshal, pMarkerCount, "HRESULT")
        return result
    }

    /**
     * The get_CurrentMarker method retrieves the current marker.
     * @param {Pointer<Integer>} pCurrentMarker Pointer to a variable that receives the current marker.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-get_currentmarker
     */
    get_CurrentMarker(pCurrentMarker) {
        pCurrentMarkerMarshal := pCurrentMarker is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCurrentMarkerMarshal, pCurrentMarker, "HRESULT")
        return result
    }

    /**
     * The GetMarkerTime method retrieves the presentation time associated with the specified marker.
     * @param {Integer} MarkerNum Specifies the marker number.
     * @param {Pointer<Float>} pMarkerTime Pointer to a variable that receives the marker time.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-getmarkertime
     */
    GetMarkerTime(MarkerNum, pMarkerTime) {
        pMarkerTimeMarshal := pMarkerTime is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, "int", MarkerNum, pMarkerTimeMarshal, pMarkerTime, "HRESULT")
        return result
    }

    /**
     * The GetMarkerName method retrieves the name associated with the specified marker.
     * @param {Integer} MarkerNum Specifies the marker number.
     * @param {Pointer<BSTR>} pbstrMarkerName Pointer to a variable that receives the marker name.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-getmarkername
     */
    GetMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(11, this, "int", MarkerNum, "ptr", pbstrMarkerName, "HRESULT")
        return result
    }

    /**
     * The put_PlaybackSpeed method specifies the playback speed.
     * @param {Float} Speed Specifies the playback speed. The value may be positive or negative, but not zero.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-put_playbackspeed
     */
    put_PlaybackSpeed(Speed) {
        result := ComCall(12, this, "double", Speed, "HRESULT")
        return result
    }

    /**
     * The get_PlaybackSpeed method retrieves the playback speed.
     * @param {Pointer<Float>} pSpeed Pointer to a variable that receives the playback speed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamextendedseeking-get_playbackspeed
     */
    get_PlaybackSpeed(pSpeed) {
        pSpeedMarshal := pSpeed is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pSpeedMarshal, pSpeed, "HRESULT")
        return result
    }
}

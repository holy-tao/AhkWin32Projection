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
     * 
     * @param {Pointer<Integer>} pExCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_exseekcapabilities
     */
    get_ExSeekCapabilities(pExCapabilities) {
        pExCapabilitiesMarshal := pExCapabilities is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pExCapabilitiesMarshal, pExCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMarkerCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_markercount
     */
    get_MarkerCount(pMarkerCount) {
        pMarkerCountMarshal := pMarkerCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarkerCountMarshal, pMarkerCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCurrentMarker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_currentmarker
     */
    get_CurrentMarker(pCurrentMarker) {
        pCurrentMarkerMarshal := pCurrentMarker is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCurrentMarkerMarshal, pCurrentMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<Float>} pMarkerTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-getmarkertime
     */
    GetMarkerTime(MarkerNum, pMarkerTime) {
        pMarkerTimeMarshal := pMarkerTime is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, "int", MarkerNum, pMarkerTimeMarshal, pMarkerTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<BSTR>} pbstrMarkerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-getmarkername
     */
    GetMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(11, this, "int", MarkerNum, "ptr", pbstrMarkerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Speed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-put_playbackspeed
     */
    put_PlaybackSpeed(Speed) {
        result := ComCall(12, this, "double", Speed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pSpeed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_playbackspeed
     */
    get_PlaybackSpeed(pSpeed) {
        pSpeedMarshal := pSpeed is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pSpeedMarshal, pSpeed, "HRESULT")
        return result
    }
}

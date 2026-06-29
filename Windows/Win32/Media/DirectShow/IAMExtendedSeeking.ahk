#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAMExtendedSeeking interface seeks to a marker in a Windows Media stream or changes the playback rate for a Windows Media file. This interface is implemented by the Windows Media Source filter and the WM ASF Reader filter.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamextendedseeking
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMExtendedSeeking extends IDispatch {
    /**
     * The interface identifier for IAMExtendedSeeking
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f9-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMExtendedSeeking interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ExSeekCapabilities : IntPtr
        get_MarkerCount        : IntPtr
        get_CurrentMarker      : IntPtr
        GetMarkerTime          : IntPtr
        GetMarkerName          : IntPtr
        put_PlaybackSpeed      : IntPtr
        get_PlaybackSpeed      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMExtendedSeeking.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {Float} 
     */
    PlaybackSpeed {
        get => this.get_PlaybackSpeed()
        set => this.put_PlaybackSpeed(value)
    }

    /**
     * The get_ExSeekCapabilities method retrieves the extended seeking capabilities of the filter.
     * @remarks
     * The Windows Media Source filter sets the extended seeking flags as follows.
     * 
     * <table>
     * <tr>
     * <td>Flag
     *             </td>
     * <td>Condition
     *             </td>
     * </tr>
     * <tr>
     * <td>AM_EXSEEK_BUFFERING</td>
     * <td>Always.</td>
     * </tr>
     * <tr>
     * <td>AM_EXSEEK_NOSTANDARDREPAINT</td>
     * <td>Always.</td>
     * </tr>
     * <tr>
     * <td>AM_EXSEEK_SENDS_VIDEOFRAMEREADY</td>
     * <td>If the video pin has been created.</td>
     * </tr>
     * <tr>
     * <td>AM_EXSEEK_CANSCAN, AM_EXSEEK_SCANWITHOUTCLOCK</td>
     * <td>If the stream supports rates other than 1.0.</td>
     * </tr>
     * <tr>
     * <td>AM_EXSEEK_CANSEEK</td>
     * <td>If the stream has been authored to be seekable.</td>
     * </tr>
     * <tr>
     * <td>AM_EXSEEK_MARKERSEEK</td>
     * <td>If the stream contains markers.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pExCapabilities Pointer to a variable that receives a bitwise OR of <a href="https://docs.microsoft.com/windows/desktop/api/qnetwork/ne-qnetwork-amextendedseekingcapabilities">AMExtendedSeekingCapabilities</a> flags.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_exseekcapabilities
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_markercount
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_currentmarker
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
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-getmarkertime
     */
    GetMarkerTime(MarkerNum, pMarkerTime) {
        pMarkerTimeMarshal := pMarkerTime is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, "int", MarkerNum, pMarkerTimeMarshal, pMarkerTime, "HRESULT")
        return result
    }

    /**
     * The GetMarkerName method retrieves the name associated with the specified marker.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Integer} MarkerNum Specifies the marker number.
     * @param {Pointer<BSTR>} pbstrMarkerName Pointer to a variable that receives the marker name.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-getmarkername
     */
    GetMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(11, this, "int", MarkerNum, BSTR.Ptr, pbstrMarkerName, "HRESULT")
        return result
    }

    /**
     * The put_PlaybackSpeed method specifies the playback speed.
     * @param {Float} Speed Specifies the playback speed. The value may be positive or negative, but not zero.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-put_playbackspeed
     */
    put_PlaybackSpeed(Speed) {
        result := ComCall(12, this, "double", Speed, "HRESULT")
        return result
    }

    /**
     * The get_PlaybackSpeed method retrieves the playback speed.
     * @param {Pointer<Float>} pSpeed Pointer to a variable that receives the playback speed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendedseeking-get_playbackspeed
     */
    get_PlaybackSpeed(pSpeed) {
        pSpeedMarshal := pSpeed is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pSpeedMarshal, pSpeed, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMExtendedSeeking.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExSeekCapabilities := CallbackCreate(GetMethod(implObj, "get_ExSeekCapabilities"), flags, 2)
        this.vtbl.get_MarkerCount := CallbackCreate(GetMethod(implObj, "get_MarkerCount"), flags, 2)
        this.vtbl.get_CurrentMarker := CallbackCreate(GetMethod(implObj, "get_CurrentMarker"), flags, 2)
        this.vtbl.GetMarkerTime := CallbackCreate(GetMethod(implObj, "GetMarkerTime"), flags, 3)
        this.vtbl.GetMarkerName := CallbackCreate(GetMethod(implObj, "GetMarkerName"), flags, 3)
        this.vtbl.put_PlaybackSpeed := CallbackCreate(GetMethod(implObj, "put_PlaybackSpeed"), flags, 2)
        this.vtbl.get_PlaybackSpeed := CallbackCreate(GetMethod(implObj, "get_PlaybackSpeed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExSeekCapabilities)
        CallbackFree(this.vtbl.get_MarkerCount)
        CallbackFree(this.vtbl.get_CurrentMarker)
        CallbackFree(this.vtbl.GetMarkerTime)
        CallbackFree(this.vtbl.GetMarkerName)
        CallbackFree(this.vtbl.put_PlaybackSpeed)
        CallbackFree(this.vtbl.get_PlaybackSpeed)
    }
}

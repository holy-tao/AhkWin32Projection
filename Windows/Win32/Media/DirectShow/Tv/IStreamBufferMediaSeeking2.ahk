#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStreamBufferMediaSeeking.ahk" { IStreamBufferMediaSeeking }

/**
 * The IStreamBufferMediaSeeking2 interface is exposed by the Stream Buffer Source filter. It provides a method to control the frame rate during fast-forward play (&#0034;trick mode&#0034;).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferMediaSeeking2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambuffermediaseeking2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferMediaSeeking2 extends IStreamBufferMediaSeeking {
    /**
     * The interface identifier for IStreamBufferMediaSeeking2
     * @type {Guid}
     */
    static IID := Guid("{3a439ab0-155f-470a-86a6-9ea54afd6eaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferMediaSeeking2 interfaces
    */
    struct Vtbl extends IStreamBufferMediaSeeking.Vtbl {
        SetRateEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferMediaSeeking2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * .
     * @remarks
     * At higher frames rates, the Stream Buffer Engine drops delta frames and may skip some key frames. This behavior is determined by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferconfigure2-setfftransitionrates">IStreamBufferConfigure2::SetFFTransitionRates</a> method. When the playback rate exceeds the value given in that method's <i>dwMaxNonSkippingRate</i> parameter, the Stream Buffer Engine starts to skip key frames. The number of skipped key frames is determined by the playback rate. To control how many key frames are skipped, use the <b>SetRateEx</b> method:
     * 
     * <ul>
     * <li>If the playback rate is less than or equal to <i>dwMaxNonSkippingRate</i>, the <i>dwFramesPerSec</i> parameter is ignored.</li>
     * <li>If the playback rate exceeds <i>dwMaxNonSkippingRate</i>, the Stream Buffer Engine maintains the frame rate specified in <i>dwFramesPerSec</i> and drops key frames if necessary.</li>
     * </ul>
     * The frame rate is applied to the video stream. If there is no video stream, the method fails. The actual frame rate may vary over short periods of time.
     * @param {Float} dRate Playback rate. Valid range is (<i>dRate</i> &gt;= 0.1 || <i>dRate</i> &lt;= -0.1).
     * @param {Integer} dwFramesPerSec Frames per second for fast-forward play. Cannot be zero. See Remarks for more information.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffermediaseeking2-setrateex
     */
    SetRateEx(dRate, dwFramesPerSec) {
        result := ComCall(20, this, "double", dRate, "uint", dwFramesPerSec, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferMediaSeeking2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRateEx := CallbackCreate(GetMethod(implObj, "SetRateEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRateEx)
    }
}

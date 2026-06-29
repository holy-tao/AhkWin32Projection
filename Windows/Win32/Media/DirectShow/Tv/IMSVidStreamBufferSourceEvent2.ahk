#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidStreamBufferSourceEvent.ahk" { IMSVidStreamBufferSourceEvent }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidStreamBufferSourceEvent2 interface is used to receive events from the MSVidStreamBufferSource object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSourceEvent2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersourceevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSourceEvent2 extends IMSVidStreamBufferSourceEvent {
    /**
     * The interface identifier for IMSVidStreamBufferSourceEvent2
     * @type {Guid}
     */
    static IID := Guid("{7aef50ce-8e22-4ba8-bc06-a92a458b4ef2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSourceEvent2 interfaces
    */
    struct Vtbl extends IMSVidStreamBufferSourceEvent.Vtbl {
        RateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSourceEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * For both parameters, 1.0 represents normal speed. Fractional values are allowed. For example, 0.2 would represent a rate that is slower than normal playback and 1.7 would represent a rate that is faster than normal playback.
     * @param {Float} qwNewRate Specifies the new playback rate.
     * @param {Float} qwOldRate Specifies the previous playback rate.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersourceevent2-ratechange
     */
    RateChange(qwNewRate, qwOldRate) {
        result := ComCall(17, this, "double", qwNewRate, "double", qwOldRate, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferSourceEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RateChange := CallbackCreate(GetMethod(implObj, "RateChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RateChange)
    }
}

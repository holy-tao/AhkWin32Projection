#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStreamBufferSink2.ahk" { IStreamBufferSink2 }

/**
 * The IStreamBufferSink3 interface is exposed by the Stream Buffer Sink filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink3)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambuffersink3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferSink3 extends IStreamBufferSink2 {
    /**
     * The interface identifier for IStreamBufferSink3
     * @type {Guid}
     */
    static IID := Guid("{974723f2-887a-4452-9366-2cff3057bc8f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferSink3 interfaces
    */
    struct Vtbl extends IStreamBufferSink2.Vtbl {
        SetAvailableFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferSink3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAvailableFilter method limits how far the Stream Buffer Source filter can seek backward, relative to the current recording position.
     * @remarks
     * The minimum seek time is an absolute position within the file. For example, suppose the value is -50000000. Immediately after the method returns, the Stream Buffer Source filter can seek backward 5 seconds, but no further. After another 15 seconds of recording, the filter can seek backward 20 seconds from the new position.
     * @param {Pointer<Integer>} prtMin On input, specifies the earliest seek time, in 100-nanosecond units, relative to the recording position when the method is called. The value must be less than or equal to zero. To make the entire backing store available, use the value -MAXLONGLONG.
     * 
     * On output, this parameter receives the actual minimum seek time. The two values may differ if the requested time exceeds the amount of time that is available.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink3-setavailablefilter
     */
    SetAvailableFilter(prtMin) {
        prtMinMarshal := prtMin is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, prtMinMarshal, prtMin, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferSink3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAvailableFilter := CallbackCreate(GetMethod(implObj, "SetAvailableFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAvailableFilter)
    }
}

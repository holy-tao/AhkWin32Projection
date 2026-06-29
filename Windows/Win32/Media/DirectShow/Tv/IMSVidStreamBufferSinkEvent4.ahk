#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidStreamBufferSinkEvent3.ahk" { IMSVidStreamBufferSinkEvent3 }

/**
 * The IMSVidStreamBufferSinkEvent4 interface receives events from the MSVidStreamBufferSink object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent4)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersinkevent4
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSinkEvent4 extends IMSVidStreamBufferSinkEvent3 {
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent4
     * @type {Guid}
     */
    static IID := Guid("{1b01dcb0-daf0-412c-a5d1-590c7f62e2b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSinkEvent4 interfaces
    */
    struct Vtbl extends IMSVidStreamBufferSinkEvent3.Vtbl {
        WriteFailureClear : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSinkEvent4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The WriteFailureClear method is called when a write error from the Stream Buffer Sink filter has been cleared.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent4-writefailureclear
     */
    WriteFailureClear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferSinkEvent4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WriteFailureClear := CallbackCreate(GetMethod(implObj, "WriteFailureClear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WriteFailureClear)
    }
}

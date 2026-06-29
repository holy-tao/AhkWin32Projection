#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\WindowsMediaFormat\INSSBuffer3.ahk" { INSSBuffer3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPin.ahk" { IPin }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMWMBufferPassCallback interface is provided for advanced scenarios in which applications need access to an INSSBuffer3 sample before it is passed downstream for further processing.
 * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nn-dshowasf-iamwmbufferpasscallback
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMWMBufferPassCallback extends IUnknown {
    /**
     * The interface identifier for IAMWMBufferPassCallback
     * @type {Guid}
     */
    static IID := Guid("{b25b8372-d2d2-44b2-8653-1b8dae332489}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMWMBufferPassCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Notify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMWMBufferPassCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Notify method is called by the pin for each buffer that is delivered during streaming.
     * @remarks
     * This method enables an application to examine and act on information in the media buffer before the buffer contents are processed. The application is responsible for knowing the media type on the pin. This information can be obtained by first getting the stream information from the profile and then calling <a href="https://docs.microsoft.com/windows/desktop/wmformat/iconfigasfwriter2-streamnumfrompin">IConfigAsfWriter2::StreamNumFromPin</a> method to determine which pin is associated with each stream.
     * @param {INSSBuffer3} pNSSBuffer3 Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer3">INSSBuffer3</a> interface exposed on the media sample.
     * @param {IPin} pPin Pointer to the pin associated with the media stream that the sample belongs to.
     * @param {Pointer<Integer>} prtStart Start time of the sample.
     * @param {Pointer<Integer>} prtEnd End time of the sample.
     * @returns {HRESULT} No particular return value is specified. The calling pin ignores the <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iamwmbufferpasscallback-notify
     */
    Notify(pNSSBuffer3, pPin, prtStart, prtEnd) {
        prtStartMarshal := prtStart is VarRef ? "int64*" : "ptr"
        prtEndMarshal := prtEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, "ptr", pNSSBuffer3, "ptr", pPin, prtStartMarshal, prtStart, prtEndMarshal, prtEnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMWMBufferPassCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Notify)
    }
}

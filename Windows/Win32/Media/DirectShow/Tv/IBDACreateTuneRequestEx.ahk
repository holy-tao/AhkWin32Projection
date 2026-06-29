#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements the CreateTuneRequestEx method, which creates a new tuning request for a tuning space.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDACreateTuneRequestEx)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ibdacreatetunerequestex
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IBDACreateTuneRequestEx extends IUnknown {
    /**
     * The interface identifier for IBDACreateTuneRequestEx
     * @type {Guid}
     */
    static IID := Guid("{c0a4a1d4-2b3c-491a-ba22-499fbadd4d12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDACreateTuneRequestEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTuneRequestEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDACreateTuneRequestEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new tuning request for a tuning space. This method enables the caller to specify a particular type of tuning request.
     * @param {Pointer<Guid>} TuneRequestIID GUID that identifies the type of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> object expected by the caller. If this value is <b>NULL</b>, this method behaves the same as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ituningspace-createtunerequest">ITuningSpace::CreateTuneRequest</a> and creates an empty (uninitialized) <b>ITuneRequest</b> object.
     * @returns {ITuneRequest} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface of the new tuning request object. The caller must release the interface. If the <i>TuneRequestIID</i> argument is <b>NULL</b>, this address is set to <b>NULL</b> also.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacreatetunerequestex-createtunerequestex
     */
    CreateTuneRequestEx(TuneRequestIID) {
        result := ComCall(3, this, Guid.Ptr, TuneRequestIID, "ptr*", &_TuneRequest := 0, "HRESULT")
        return ITuneRequest(_TuneRequest)
    }

    Query(iid) {
        if (IBDACreateTuneRequestEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTuneRequestEx := CallbackCreate(GetMethod(implObj, "CreateTuneRequestEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTuneRequestEx)
    }
}

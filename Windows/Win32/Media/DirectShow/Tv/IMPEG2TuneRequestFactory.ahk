#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMPEG2TuneRequest.ahk" { IMPEG2TuneRequest }

/**
 * The IMPEG2TuneRequestFactory interface creates a tune request for a basic MPEG-2 transport stream containing the minimal tables. To obtain this interface, call CoCreateInstance with the class identifier CLSID_MPEG2TuneRequestFactory.
 * @remarks
 * To create a full tune request, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ibdacreatetunerequestex">CreateTuneRequest</a> method provided by one of the tuning space objects.
 *       
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2TuneRequestFactory)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-impeg2tunerequestfactory
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMPEG2TuneRequestFactory extends IDispatch {
    /**
     * The interface identifier for IMPEG2TuneRequestFactory
     * @type {Guid}
     */
    static IID := Guid("{14e11abd-ee37-4893-9ea1-6964de933e39}")

    /**
     * The class identifier for MPEG2TuneRequestFactory
     * @type {Guid}
     */
    static CLSID := Guid("{2c63e4eb-4cea-41b8-919c-e947ea19a77c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2TuneRequestFactory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateTuneRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2TuneRequestFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateTuneRequest method creates the minimal MPEG-2 tune request for a specified tuning space.
     * @param {ITuningSpace} _TuningSpace Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface of the tuning space.
     * @returns {IMPEG2TuneRequest} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-impeg2tunerequest">IMPEG2TuneRequest</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2tunerequestfactory-createtunerequest
     */
    CreateTuneRequest(_TuningSpace) {
        result := ComCall(7, this, "ptr", _TuningSpace, "ptr*", &_TuneRequest := 0, "HRESULT")
        return IMPEG2TuneRequest(_TuneRequest)
    }

    Query(iid) {
        if (IMPEG2TuneRequestFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTuneRequest := CallbackCreate(GetMethod(implObj, "CreateTuneRequest"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTuneRequest)
    }
}

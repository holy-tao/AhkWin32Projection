#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILocator.ahk" { ILocator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\AnalogVideoStandard.ahk" { AnalogVideoStandard }

/**
 * The IAnalogLocator interface provides tuning information for an analog television network.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ianaloglocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAnalogLocator extends ILocator {
    /**
     * The interface identifier for IAnalogLocator
     * @type {Guid}
     */
    static IID := Guid("{34d1f26b-e339-430d-abce-738cb48984dc}")

    /**
     * The class identifier for AnalogLocator
     * @type {Guid}
     */
    static CLSID := Guid("{49638b91-48ab-48b7-a47a-7d0e75a08ede}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnalogLocator interfaces
    */
    struct Vtbl extends ILocator.Vtbl {
        get_VideoStandard : IntPtr
        put_VideoStandard : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnalogLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {AnalogVideoStandard} 
     */
    VideoStandard {
        get => this.get_VideoStandard()
        set => this.put_VideoStandard(value)
    }

    /**
     * The get_VideoStandard method retrieves the format of the analog television signal.
     * @returns {AnalogVideoStandard} Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> variable that receives the format of the analog television signal.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianaloglocator-get_videostandard
     */
    get_VideoStandard() {
        result := ComCall(22, this, "int*", &AVS := 0, "HRESULT")
        return AVS
    }

    /**
     * The put_VideoStandard method specifies the format of the analog television signal.
     * @param {AnalogVideoStandard} AVS Specifies the format of the analog television signal. This parameter is of type <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved by using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianaloglocator-put_videostandard
     */
    put_VideoStandard(AVS) {
        result := ComCall(23, this, AnalogVideoStandard, AVS, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAnalogLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_VideoStandard := CallbackCreate(GetMethod(implObj, "get_VideoStandard"), flags, 2)
        this.vtbl.put_VideoStandard := CallbackCreate(GetMethod(implObj, "put_VideoStandard"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_VideoStandard)
        CallbackFree(this.vtbl.put_VideoStandard)
    }
}

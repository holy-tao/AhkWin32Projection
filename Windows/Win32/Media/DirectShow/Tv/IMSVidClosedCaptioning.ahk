#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidFeature.ahk" { IMSVidFeature }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IMSVidClosedCaptioning interface enables or disables closed captions.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidClosedCaptioning)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidclosedcaptioning
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidClosedCaptioning extends IMSVidFeature {
    /**
     * The interface identifier for IMSVidClosedCaptioning
     * @type {Guid}
     */
    static IID := Guid("{99652ea1-c1f7-414f-bb7b-1c967de75983}")

    /**
     * The class identifier for MSVidClosedCaptioning
     * @type {Guid}
     */
    static CLSID := Guid("{7f9cb14d-48e4-43b6-9346-1aebc39c64d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidClosedCaptioning interfaces
    */
    struct Vtbl extends IMSVidFeature.Vtbl {
        get_Enable : IntPtr
        put_Enable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidClosedCaptioning.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enable {
        get => this.get_Enable()
        set => this.put_Enable(value)
    }

    /**
     * The get_Enable method queries whether closed captioning is enabled.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning-get_enable
     */
    get_Enable() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &On := 0, "HRESULT")
        return On
    }

    /**
     * The put_Enable method enables or disables closed captioning.
     * @param {VARIANT_BOOL} On 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning-put_enable
     */
    put_Enable(On) {
        result := ComCall(17, this, VARIANT_BOOL, On, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidClosedCaptioning.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Enable := CallbackCreate(GetMethod(implObj, "get_Enable"), flags, 2)
        this.vtbl.put_Enable := CallbackCreate(GetMethod(implObj, "put_Enable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Enable)
        CallbackFree(this.vtbl.put_Enable)
    }
}

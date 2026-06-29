#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The ITMediaSupport interface provides methods that allow an application to discover the media support capabilities for an Address Object that exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itmediasupport
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITMediaSupport extends IDispatch {
    /**
     * The interface identifier for ITMediaSupport
     * @type {Guid}
     */
    static IID := Guid("{b1efc384-9355-11d0-835c-00aa003ccabd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITMediaSupport interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_MediaTypes : IntPtr
        QueryMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITMediaSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MediaTypes {
        get => this.get_MediaTypes()
    }

    /**
     * The get_MediaTypes method gets the media type or types supported on the current address.
     * @returns {Integer} Pointer to bitmask of ORed of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediasupport-get_mediatypes
     */
    get_MediaTypes() {
        result := ComCall(7, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * The QueryMediaType method indicates whether the service provider associated with the current address supports the media type or types indicated by lMediaType.
     * @param {Integer} lMediaType <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">Media type</a> or types being queried.
     * @returns {VARIANT_BOOL} Pointer to a VARIANT_BOOL indicating whether the media type is supported. If the returned value is VARIANT_TRUE, the media is supported; if it is VARIANT_FALSE, the media is not supported.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediasupport-querymediatype
     */
    QueryMediaType(lMediaType) {
        result := ComCall(8, this, "int", lMediaType, VARIANT_BOOL.Ptr, &pfSupport := 0, "HRESULT")
        return pfSupport
    }

    Query(iid) {
        if (ITMediaSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MediaTypes := CallbackCreate(GetMethod(implObj, "get_MediaTypes"), flags, 2)
        this.vtbl.QueryMediaType := CallbackCreate(GetMethod(implObj, "QueryMediaType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MediaTypes)
        CallbackFree(this.vtbl.QueryMediaType)
    }
}

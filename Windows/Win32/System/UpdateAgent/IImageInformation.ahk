#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains information about a localized image that is associated with an update or a category.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iimageinformation
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IImageInformation extends IDispatch {
    /**
     * The interface identifier for IImageInformation
     * @type {Guid}
     */
    static IID := Guid("{7c907864-346c-4aeb-8f3f-57da289f969f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImageInformation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AltText : IntPtr
        get_Height  : IntPtr
        get_Source  : IntPtr
        get_Width   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImageInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    AltText {
        get => this.get_AltText()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {BSTR} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the alternate text for the image.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_alttext
     */
    get_AltText() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the height of the image, in pixels.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_height
     */
    get_Height() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the source location of the image.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_source
     */
    get_Source() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the width of the image, in pixels.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_width
     */
    get_Width() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IImageInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AltText := CallbackCreate(GetMethod(implObj, "get_AltText"), flags, 2)
        this.vtbl.get_Height := CallbackCreate(GetMethod(implObj, "get_Height"), flags, 2)
        this.vtbl.get_Source := CallbackCreate(GetMethod(implObj, "get_Source"), flags, 2)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AltText)
        CallbackFree(this.vtbl.get_Height)
        CallbackFree(this.vtbl.get_Source)
        CallbackFree(this.vtbl.get_Width)
    }
}

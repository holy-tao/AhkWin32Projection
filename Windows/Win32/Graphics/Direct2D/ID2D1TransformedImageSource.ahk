#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Image.ahk" { ID2D1Image }
#Import ".\ID2D1ImageSource.ahk" { ID2D1ImageSource }
#Import ".\D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES.ahk" { D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES }

/**
 * Represents an image source which shares resources with an original image source.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1transformedimagesource
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1TransformedImageSource extends ID2D1Image {
    /**
     * The interface identifier for ID2D1TransformedImageSource
     * @type {Guid}
     */
    static IID := Guid("{7f1f79e5-2796-416c-8f55-700f911445e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1TransformedImageSource interfaces
    */
    struct Vtbl extends ID2D1Image.Vtbl {
        GetSource     : IntPtr
        GetProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1TransformedImageSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the source image used to create the transformed image source.
     * @param {Pointer<ID2D1ImageSource>} imageSource Type: <b>_Outptr_result_maybenull_**</b>
     * 
     * Retrieves the source image used to create the transformed image source.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1transformedimagesource-getsource
     */
    GetSource(imageSource) {
        ComCall(4, this, ID2D1ImageSource.Ptr, imageSource)
    }

    /**
     * Retrieves the properties specified when the transformed image source was created.
     * @param {Pointer<D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES>} _properties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_transformed_image_source_properties">D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES</a>*</b>
     * 
     * the properties specified when the transformed image source was created.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1transformedimagesource-getproperties
     */
    GetProperties(_properties) {
        ComCall(5, this, D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES.Ptr, _properties)
    }

    Query(iid) {
        if (ID2D1TransformedImageSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 2)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSource)
        CallbackFree(this.vtbl.GetProperties)
    }
}

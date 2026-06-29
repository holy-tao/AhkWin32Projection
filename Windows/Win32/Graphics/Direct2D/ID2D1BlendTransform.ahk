#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1ConcreteTransform.ahk" { ID2D1ConcreteTransform }
#Import ".\D2D1_BLEND_DESCRIPTION.ahk" { D2D1_BLEND_DESCRIPTION }

/**
 * Provides methods to allow a blend operation to be inserted into a transform graph.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1blendtransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1BlendTransform extends ID2D1ConcreteTransform {
    /**
     * The interface identifier for ID2D1BlendTransform
     * @type {Guid}
     */
    static IID := Guid("{63ac0b32-ba44-450f-8806-7f4ca1ff2f1b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1BlendTransform interfaces
    */
    struct Vtbl extends ID2D1ConcreteTransform.Vtbl {
        SetDescription : IntPtr
        GetDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1BlendTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Changes the blend description of the corresponding blend transform object.
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} description Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_blend_description">D2D1_BLEND_DESCRIPTION</a>*</b>
     * 
     * The new blend description specified for the blend transform.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1blendtransform-setdescription
     */
    SetDescription(description) {
        ComCall(6, this, D2D1_BLEND_DESCRIPTION.Ptr, description)
    }

    /**
     * Gets the blend description of the corresponding blend transform object.
     * @param {Pointer<D2D1_BLEND_DESCRIPTION>} description Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_blend_description">D2D1_BLEND_DESCRIPTION</a>*</b>
     * 
     * When this method returns, contains the blend description specified for the blend transform.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1blendtransform-getdescription
     */
    GetDescription(description) {
        ComCall(7, this, D2D1_BLEND_DESCRIPTION.Ptr, description)
    }

    Query(iid) {
        if (ID2D1BlendTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDescription := CallbackCreate(GetMethod(implObj, "SetDescription"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDescription)
        CallbackFree(this.vtbl.GetDescription)
    }
}

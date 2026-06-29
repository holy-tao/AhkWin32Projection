#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes the base representation of all presentation content.
 * @remarks
 * All types of presentation content derive from this interface.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationcontent
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentationContent extends IUnknown {
    /**
     * The interface identifier for IPresentationContent
     * @type {Guid}
     */
    static IID := Guid("{5668bb79-3d8e-415c-b215-f38020f2d252}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentationContent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTag : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentationContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a user-defined tag to associate with this content. This tag is how the content is referenced in statistics.
     * @param {Pointer} tag Type: **[UINT_PTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The tag to associate with this content.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationcontent-settag
     */
    SetTag(tag) {
        ComCall(3, this, "ptr", tag)
    }

    Query(iid) {
        if (IPresentationContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTag := CallbackCreate(GetMethod(implObj, "SetTag"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTag)
    }
}

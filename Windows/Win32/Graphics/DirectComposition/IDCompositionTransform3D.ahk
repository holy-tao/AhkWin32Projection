#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionEffect.ahk" { IDCompositionEffect }

/**
 * Represents a 3D transformation effect that can be used to modify the rasterization of a visual subtree.
 * @remarks
 * The <b>IDCompositionTransform3D</b> interface is an abstract interface that represents a 3D perspective transformation effect. A 3D transform object can be associated with multiple visuals and multiple effect groups. When a 3D transform object is modified, all affected visuals are recomposed to reflect the change.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiontransform3d
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionTransform3D extends IDCompositionEffect {
    /**
     * The interface identifier for IDCompositionTransform3D
     * @type {Guid}
     */
    static IID := Guid("{71185722-246b-41f2-aad1-0443f7f4bfc2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionTransform3D interfaces
    */
    struct Vtbl extends IDCompositionEffect.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionTransform3D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDCompositionTransform3D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}

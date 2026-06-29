#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionTransform3D.ahk" { IDCompositionTransform3D }

/**
 * Represents a 2D transformation that can be used to modify the coordinate space of a visual subtree.
 * @remarks
 * The <b>IDCompositionTransform</b> interface is an abstract interface that represents a 2D affine transformation. Transformations affect the entire visual subtree that is rooted at the visual that the transform is associated with. A transform object can be associated with multiple visuals. When a transform object is modified, all affected visuals are recomposed to reflect the change.
 * 
 * Transforms operate by modifying the coordinate system for all rendering operations on a visual. For example, ordinarily a bitmap that is associated with a visual draws at position (0,0) and extends the full width and height of the bitmap. If a translation transform is applied, the bitmap draws at a position that is offset by that transform. If a scale transform is applied, the extent covered by the bitmap is affected by the scale transform. More than one transform can be simultaneously applied to a visual by using the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createtransformgroup">IDCompositionDevice::CreateTransformGroup</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiontransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionTransform extends IDCompositionTransform3D {
    /**
     * The interface identifier for IDCompositionTransform
     * @type {Guid}
     */
    static IID := Guid("{fd55faa7-37e0-4c20-95d2-9be45bc33f55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionTransform interfaces
    */
    struct Vtbl extends IDCompositionTransform3D.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDCompositionTransform.IID.Equals(iid)) {
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

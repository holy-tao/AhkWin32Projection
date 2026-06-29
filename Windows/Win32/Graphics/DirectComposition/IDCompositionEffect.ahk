#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a bitmap effect that modifies the rasterization of a visual's subtree.
 * @remarks
 * <b>IDCompositionEffect</b> is an abstract interface that represents a bitmap effect. An effect applies to the entire visual subtree rooted at the visual that the effect is associated with. An effect object can be associated with multiple visuals. When an effect object is modified, all affected visuals are recomposed to reflect the change.
 * 
 * 
 * 
 * More than one effect can be simultaneously applied to a visual by using the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffectgroup">IDCompositionEffectGroup</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositioneffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionEffect extends IUnknown {
    /**
     * The interface identifier for IDCompositionEffect
     * @type {Guid}
     */
    static IID := Guid("{ec81b08f-bfcb-4e8d-b193-a915587999e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionEffect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDCompositionEffect.IID.Equals(iid)) {
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

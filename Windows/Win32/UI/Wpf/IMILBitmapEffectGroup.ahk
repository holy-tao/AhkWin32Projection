#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMILBitmapEffect.ahk" { IMILBitmapEffect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectInputConnector.ahk" { IMILBitmapEffectInputConnector }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMILBitmapEffectOutputConnector.ahk" { IMILBitmapEffectOutputConnector }

/**
 * Exposes methods used to access a group of effects.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectgroup
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectGroup extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectGroup
     * @type {Guid}
     */
    static IID := Guid("{2f952360-698a-4ac6-81a1-bcfdf08eb8e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInteriorInputConnector  : IntPtr
        GetInteriorOutputConnector : IntPtr
        Add                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the input connector for an effect at the given index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the effect to retrieve the connector.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the desired effects input connector.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroup-getinteriorinputconnector
     */
    GetInteriorInputConnector(uiIndex) {
        result := ComCall(3, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(ppConnector)
    }

    /**
     * Retrieves the output connector for an effect at the given index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the effect to retrieve the connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the desired effects output connector.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroup-getinterioroutputconnector
     */
    GetInteriorOutputConnector(uiIndex) {
        result := ComCall(4, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(ppConnector)
    }

    /**
     * Adds an effect to the IMILBitmapEffectGroup.
     * @param {IMILBitmapEffect} pEffect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>*</b>
     * 
     * A pointer to the effect to add to the group.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroup-add
     */
    Add(pEffect) {
        result := ComCall(5, this, "ptr", pEffect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInteriorInputConnector := CallbackCreate(GetMethod(implObj, "GetInteriorInputConnector"), flags, 3)
        this.vtbl.GetInteriorOutputConnector := CallbackCreate(GetMethod(implObj, "GetInteriorOutputConnector"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInteriorInputConnector)
        CallbackFree(this.vtbl.GetInteriorOutputConnector)
        CallbackFree(this.vtbl.Add)
    }
}

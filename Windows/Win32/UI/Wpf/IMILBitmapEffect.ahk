#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Imaging\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectRenderContext.ahk" { IMILBitmapEffectRenderContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMILBitmapEffectGroup.ahk" { IMILBitmapEffectGroup }

/**
 * Exposes methods that define a Windows Presentation Foundation (WPF) bitmap effect.
 * @remarks
 * <b>IMILBitmapEffect</b> is a wrapper for a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectprimitive">IMILBitmapEffectPrimitive</a>. A <b>IMILBitmapEffectPrimitive</b> is wrapped by a <b>IMILBitmapEffect</b> through Component Object Model (COM) aggregation.
 *             Therefore, independent software vendor (ISV) effect writers do not need to implement the <b>IMILBitmapEffect</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectimpl">IMILBitmapEffectImpl</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnections">IMILBitmapEffectConnections</a> interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffect
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffect extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffect
     * @type {Guid}
     */
    static IID := Guid("{8a6ff321-c944-4a1b-9944-9954af301258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOutput       : IntPtr
        GetParentEffect : IntPtr
        SetInputSource  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the output of the effect.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The output index.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * A pointer to the render context of the effect.
     * @returns {IWICBitmapSource} Type: <b>IWICBitmapSource**</b>
     * 
     * A pointer that receives a pointer to the effect's output.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffect-getoutput
     */
    GetOutput(uiIndex, pContext) {
        result := ComCall(3, this, "uint", uiIndex, "ptr", pContext, "ptr*", &ppBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppBitmapSource)
    }

    /**
     * Gets a parent of the effect.
     * @returns {IMILBitmapEffectGroup} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffect-getparenteffect
     */
    GetParentEffect() {
        result := ComCall(4, this, "ptr*", &ppParentEffect := 0, "HRESULT")
        return IMILBitmapEffectGroup(ppParentEffect)
    }

    /**
     * Sets the effect input source.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The input index.
     * @param {IWICBitmapSource} pBitmapSource Type: <b>IWICBitmapSource*</b>
     * 
     * A pointer to the effect's bitmap source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffect-setinputsource
     */
    SetInputSource(uiIndex, pBitmapSource) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", pBitmapSource, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOutput := CallbackCreate(GetMethod(implObj, "GetOutput"), flags, 4)
        this.vtbl.GetParentEffect := CallbackCreate(GetMethod(implObj, "GetParentEffect"), flags, 2)
        this.vtbl.SetInputSource := CallbackCreate(GetMethod(implObj, "SetInputSource"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOutput)
        CallbackFree(this.vtbl.GetParentEffect)
        CallbackFree(this.vtbl.SetInputSource)
    }
}

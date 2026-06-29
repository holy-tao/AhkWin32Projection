#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionVisual2.ahk" { IDCompositionVisual2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct2D\Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }

/**
 * Represents a debug visual.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisualdebug
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionVisualDebug extends IDCompositionVisual2 {
    /**
     * The interface identifier for IDCompositionVisualDebug
     * @type {Guid}
     */
    static IID := Guid("{fed2b808-5eb4-43a0-aea3-35f65280f91b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionVisualDebug interfaces
    */
    struct Vtbl extends IDCompositionVisual2.Vtbl {
        EnableHeatMap        : IntPtr
        DisableHeatMap       : IntPtr
        EnableRedrawRegions  : IntPtr
        DisableRedrawRegions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionVisualDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a visual heatmap that represents overdraw regions.
     * @remarks
     * Heatmaps can be enabled by calling <b>EnableHeatMap</b>. The heatmaps are drawn on the source of the VisualDebug visual and child visuals. The heatmaps are represented in a specified color for all visual content. The heatmap color must have a transparency in order to see the overlaying overdraw regions. The colored surfaces are blended together to visually show all overdraw regions in a single view.
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-enableheatmap
     */
    EnableHeatMap(_color) {
        result := ComCall(22, this, D2D1_COLOR_F.Ptr, _color, "HRESULT")
        return result
    }

    /**
     * Disables visual heatmaps.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-disableheatmap
     */
    DisableHeatMap() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Enables highlighting visuals when content is being redrawn.
     * @remarks
     * Highlighting redraw regions can be enabled by calling <b>EnableRedrawRegions</b>.  With this function, redrawn client areas are visually highlighted every frame the visual is updated. Redraw regions are drawn on the source of the VisualDebug and child visuals. Redraw is triggered when properties of a visual are updated. The updated visual does not necessarily need to visually change to trigger a redraw. The highlighting will cycle through Blue, Yellow, Pink and Green to provide an order of which content is being updated. The redraw regions are only visible while the window of the VisualDebug is being updated.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-enableredrawregions
     */
    EnableRedrawRegions() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Disables visual redraw regions.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-disableredrawregions
     */
    DisableRedrawRegions() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionVisualDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableHeatMap := CallbackCreate(GetMethod(implObj, "EnableHeatMap"), flags, 2)
        this.vtbl.DisableHeatMap := CallbackCreate(GetMethod(implObj, "DisableHeatMap"), flags, 1)
        this.vtbl.EnableRedrawRegions := CallbackCreate(GetMethod(implObj, "EnableRedrawRegions"), flags, 1)
        this.vtbl.DisableRedrawRegions := CallbackCreate(GetMethod(implObj, "DisableRedrawRegions"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableHeatMap)
        CallbackFree(this.vtbl.DisableHeatMap)
        CallbackFree(this.vtbl.EnableRedrawRegions)
        CallbackFree(this.vtbl.DisableRedrawRegions)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisual2.ahk

/**
 * Represents a debug visual.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisualdebug
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVisualDebug extends IDCompositionVisual2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionVisualDebug
     * @type {Guid}
     */
    static IID => Guid("{fed2b808-5eb4-43a0-aea3-35f65280f91b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableHeatMap", "DisableHeatMap", "EnableRedrawRegions", "DisableRedrawRegions"]

    /**
     * Enables a visual heatmap that represents overdraw regions.
     * @remarks
     * Heatmaps can be enabled by calling <b>EnableHeatMap</b>. The heatmaps are drawn on the source of the VisualDebug visual and child visuals. The heatmaps are represented in a specified color for all visual content. The heatmap color must have a transparency in order to see the overlaying overdraw regions. The colored surfaces are blended together to visually show all overdraw regions in a single view.
     * @param {Pointer<D2D1_COLOR_F>} _color 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-enableheatmap
     */
    EnableHeatMap(_color) {
        result := ComCall(22, this, "ptr", _color, "HRESULT")
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
}

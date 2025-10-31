#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisual2.ahk

/**
 * Represents a debug visual.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvisualdebug
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
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-enableheatmap
     */
    EnableHeatMap(color) {
        result := ComCall(22, this, "ptr", color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-disableheatmap
     */
    DisableHeatMap() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-enableredrawregions
     */
    EnableRedrawRegions() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisualdebug-disableredrawregions
     */
    DisableRedrawRegions() {
        result := ComCall(25, this, "HRESULT")
        return result
    }
}

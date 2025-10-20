#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Handles manipulation and inertia events.
 * @see https://docs.microsoft.com/windows/win32/api//manipulations/nn-manipulations-_imanipulationevents
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class _IManipulationEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IManipulationEvents
     * @type {Guid}
     */
    static IID => Guid("{4f62c8da-9c53-4b22-93df-927a862bbb03}")

    /**
     * The class identifier for _IManipulationEvents
     * @type {Guid}
     */
    static CLSID => Guid("{4f62c8da-9c53-4b22-93df-927a862bbb03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ManipulationStarted", "ManipulationDelta", "ManipulationCompleted"]

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationstarted
     */
    ManipulationStarted(x, y) {
        result := ComCall(3, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} translationDeltaX 
     * @param {Float} translationDeltaY 
     * @param {Float} scaleDelta 
     * @param {Float} expansionDelta 
     * @param {Float} rotationDelta 
     * @param {Float} cumulativeTranslationX 
     * @param {Float} cumulativeTranslationY 
     * @param {Float} cumulativeScale 
     * @param {Float} cumulativeExpansion 
     * @param {Float} cumulativeRotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationdelta
     */
    ManipulationDelta(x, y, translationDeltaX, translationDeltaY, scaleDelta, expansionDelta, rotationDelta, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation) {
        result := ComCall(4, this, "float", x, "float", y, "float", translationDeltaX, "float", translationDeltaY, "float", scaleDelta, "float", expansionDelta, "float", rotationDelta, "float", cumulativeTranslationX, "float", cumulativeTranslationY, "float", cumulativeScale, "float", cumulativeExpansion, "float", cumulativeRotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} cumulativeTranslationX 
     * @param {Float} cumulativeTranslationY 
     * @param {Float} cumulativeScale 
     * @param {Float} cumulativeExpansion 
     * @param {Float} cumulativeRotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted
     */
    ManipulationCompleted(x, y, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation) {
        result := ComCall(5, this, "float", x, "float", y, "float", cumulativeTranslationX, "float", cumulativeTranslationY, "float", cumulativeScale, "float", cumulativeExpansion, "float", cumulativeRotation, "HRESULT")
        return result
    }
}

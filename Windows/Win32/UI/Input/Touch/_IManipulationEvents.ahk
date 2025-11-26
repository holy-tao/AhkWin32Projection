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
     * Handles the event for when manipulation or inertia begins.
     * @param {Float} x The origin x-coordinate in user-defined coordinates.
     * @param {Float} y The origin y-coordinate in user-defined coordinates.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-_imanipulationevents-manipulationstarted
     */
    ManipulationStarted(x, y) {
        result := ComCall(3, this, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * Handles events that happen when a manipulated object changes.
     * @param {Float} x The origin x-coordinate in user-defined coordinates.
     * @param {Float} y The origin y-coordinate in user-defined coordinates.
     * @param {Float} translationDeltaX The translation change about the x-axis in user-defined coordinates since the last event.
     * @param {Float} translationDeltaY The translation change about the y-axis in user-defined coordinates since the last event.
     * @param {Float} scaleDelta The scale change since the previous event as a percentage of the previous scale.
     * @param {Float} expansionDelta The expansion change since the previous event in user-defined coordinates.
     * @param {Float} rotationDelta The rotation change since the previous event in radians.
     * @param {Float} cumulativeTranslationX The translation about the x-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeTranslationY The translation about the y-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeScale The scale change since the beginning of the manipulation as a percentage of the original size.
     * @param {Float} cumulativeExpansion The expansion change since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeRotation The rotation change since the beginning of the manipulation in radians.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-_imanipulationevents-manipulationdelta
     */
    ManipulationDelta(x, y, translationDeltaX, translationDeltaY, scaleDelta, expansionDelta, rotationDelta, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation) {
        result := ComCall(4, this, "float", x, "float", y, "float", translationDeltaX, "float", translationDeltaY, "float", scaleDelta, "float", expansionDelta, "float", rotationDelta, "float", cumulativeTranslationX, "float", cumulativeTranslationY, "float", cumulativeScale, "float", cumulativeExpansion, "float", cumulativeRotation, "HRESULT")
        return result
    }

    /**
     * Handles the event when manipulation or inertia finishes.
     * @param {Float} x The origin x-coordinate in user-defined coordinates.
     * @param {Float} y The origin y-coordinate in user-defined coordinates.
     * @param {Float} cumulativeTranslationX The total translation about the x-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeTranslationY The total translation about the y-axis since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeScale The total scale change since the beginning of the manipulation as a percentage of the original size.
     * @param {Float} cumulativeExpansion The total expansion change since the beginning of the manipulation in user-defined coordinates.
     * @param {Float} cumulativeRotation The total rotation change since the beginning of the manipulation in radians.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//manipulations/nf-manipulations-_imanipulationevents-manipulationcompleted
     */
    ManipulationCompleted(x, y, cumulativeTranslationX, cumulativeTranslationY, cumulativeScale, cumulativeExpansion, cumulativeRotation) {
        result := ComCall(5, this, "float", x, "float", y, "float", cumulativeTranslationX, "float", cumulativeTranslationY, "float", cumulativeScale, "float", cumulativeExpansion, "float", cumulativeRotation, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerStatics2
     * @type {Guid}
     */
    static IID => Guid("{35e53720-46b7-5cb0-b505-f3d6884a6163}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBindingMode", "GetBindingMode"]

    /**
     * 
     * @param {InteractionTracker} boundTracker1 
     * @param {InteractionTracker} boundTracker2 
     * @param {Integer} axisMode 
     * @returns {HRESULT} 
     */
    SetBindingMode(boundTracker1, boundTracker2, axisMode) {
        result := ComCall(6, this, "ptr", boundTracker1, "ptr", boundTracker2, "uint", axisMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {InteractionTracker} boundTracker1 
     * @param {InteractionTracker} boundTracker2 
     * @returns {Integer} 
     */
    GetBindingMode(boundTracker1, boundTracker2) {
        result := ComCall(7, this, "ptr", boundTracker1, "ptr", boundTracker2, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

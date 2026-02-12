#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTracker5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTracker5
     * @type {Guid}
     */
    static IID => Guid("{d3ef5da2-a254-40e4-88d5-44e4e16b5809}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryUpdatePositionWithOption"]

    /**
     * 
     * @param {Vector3} value 
     * @param {Integer} option 
     * @param {Integer} posUpdateOption 
     * @returns {Integer} 
     */
    TryUpdatePositionWithOption(value, option, posUpdateOption) {
        result := ComCall(6, this, "ptr", value, "int", option, "int", posUpdateOption, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

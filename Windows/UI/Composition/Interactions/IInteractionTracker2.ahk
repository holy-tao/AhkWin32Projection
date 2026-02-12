#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTracker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTracker2
     * @type {Guid}
     */
    static IID => Guid("{25769a3e-ce6d-448c-8386-92620d240756}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureCenterPointXInertiaModifiers", "ConfigureCenterPointYInertiaModifiers"]

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureCenterPointXInertiaModifiers(conditionalValues) {
        result := ComCall(6, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     */
    ConfigureCenterPointYInertiaModifiers(conditionalValues) {
        result := ComCall(7, this, "ptr", conditionalValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

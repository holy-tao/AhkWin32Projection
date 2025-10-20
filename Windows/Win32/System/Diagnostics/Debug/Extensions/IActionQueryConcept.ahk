#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IActionQueryConcept extends IUnknown{
    /**
     * The interface identifier for IActionQueryConcept
     * @type {Guid}
     */
    static IID => Guid("{7fc09c9f-632d-48e8-a97b-2f4f2e5c1161}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IActionEnumerator>} actionEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateActions(contextObject, actionEnumerator) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", actionEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

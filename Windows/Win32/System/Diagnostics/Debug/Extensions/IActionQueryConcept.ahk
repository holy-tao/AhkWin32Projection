#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include .\IActionEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IActionQueryConcept extends IUnknown {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateActions"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IActionEnumerator} 
     */
    EnumerateActions(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "ptr*", &actionEnumerator := 0, "HRESULT")
        return IActionEnumerator(actionEnumerator)
    }
}

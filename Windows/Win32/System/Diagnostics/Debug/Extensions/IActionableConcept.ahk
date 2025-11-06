#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActionEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IActionableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionableConcept
     * @type {Guid}
     */
    static IID => Guid("{2cd9906f-f1b3-4463-828a-0addafe8baae}")

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

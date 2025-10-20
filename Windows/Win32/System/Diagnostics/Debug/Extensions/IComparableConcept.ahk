#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IComparableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComparableConcept
     * @type {Guid}
     */
    static IID => Guid("{a7830646-9f0c-4a31-ba19-503f33e6c8a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompareObjects"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {IModelObject} otherObject 
     * @param {Pointer<Integer>} comparisonResult 
     * @returns {HRESULT} 
     */
    CompareObjects(contextObject, otherObject, comparisonResult) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", otherObject, "int*", comparisonResult, "HRESULT")
        return result
    }
}

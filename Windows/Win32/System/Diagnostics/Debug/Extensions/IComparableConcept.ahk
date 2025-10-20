#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IComparableConcept extends IUnknown{
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
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IModelObject>} otherObject 
     * @param {Pointer<Int32>} comparisonResult 
     * @returns {HRESULT} 
     */
    CompareObjects(contextObject, otherObject, comparisonResult) {
        result := ComCall(3, this, "ptr", contextObject, "ptr", otherObject, "int*", comparisonResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

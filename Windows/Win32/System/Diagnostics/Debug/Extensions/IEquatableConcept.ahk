#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IEquatableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEquatableConcept
     * @type {Guid}
     */
    static IID => Guid("{c52d5d3d-609d-4d5d-8a82-46b0acdec4f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AreObjectsEqual"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {IModelObject} otherObject 
     * @param {Pointer<Boolean>} isEqual 
     * @returns {HRESULT} 
     */
    AreObjectsEqual(contextObject, otherObject, isEqual) {
        isEqualMarshal := isEqual is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", contextObject, "ptr", otherObject, isEqualMarshal, isEqual, "HRESULT")
        return result
    }
}

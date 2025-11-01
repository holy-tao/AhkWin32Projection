#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IObjectWrapperConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWrapperConcept
     * @type {Guid}
     */
    static IID => Guid("{a4952c59-7144-4c76-873b-6046c0955ffc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWrappedObject"]

    /**
     * 
     * @param {IModelObject} pContextObject 
     * @param {Pointer<IModelObject>} wrappedObject 
     * @param {Pointer<Integer>} pUsagePreference 
     * @returns {HRESULT} 
     */
    GetWrappedObject(pContextObject, wrappedObject, pUsagePreference) {
        pUsagePreferenceMarshal := pUsagePreference is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pContextObject, "ptr*", wrappedObject, pUsagePreferenceMarshal, pUsagePreference, "HRESULT")
        return result
    }
}

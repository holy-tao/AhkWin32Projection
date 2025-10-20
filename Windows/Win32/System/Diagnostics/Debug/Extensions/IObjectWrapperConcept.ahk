#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IObjectWrapperConcept extends IUnknown{
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
     * 
     * @param {Pointer<IModelObject>} pContextObject 
     * @param {Pointer<IModelObject>} wrappedObject 
     * @param {Pointer<Int32>} pUsagePreference 
     * @returns {HRESULT} 
     */
    GetWrappedObject(pContextObject, wrappedObject, pUsagePreference) {
        result := ComCall(3, this, "ptr", pContextObject, "ptr", wrappedObject, "int*", pUsagePreference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

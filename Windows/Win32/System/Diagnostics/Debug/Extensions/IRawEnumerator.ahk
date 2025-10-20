#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IRawEnumerator extends IUnknown{
    /**
     * The interface identifier for IRawEnumerator
     * @type {Guid}
     */
    static IID => Guid("{e13613f9-3a3c-40b5-8f48-1e5ebfb9b21b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @param {Pointer<Int32>} kind 
     * @param {Pointer<IModelObject>} value 
     * @returns {HRESULT} 
     */
    GetNext(name, kind, value) {
        result := ComCall(4, this, "ptr", name, "int*", kind, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

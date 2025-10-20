#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IKeyEnumerator extends IUnknown{
    /**
     * The interface identifier for IKeyEnumerator
     * @type {Guid}
     */
    static IID => Guid("{345fa92e-5e00-4319-9cae-971f7601cdcf}")

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
     * @param {Pointer<BSTR>} key 
     * @param {Pointer<IModelObject>} value 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetNext(key, value, metadata) {
        result := ComCall(4, this, "ptr", key, "ptr", value, "ptr", metadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

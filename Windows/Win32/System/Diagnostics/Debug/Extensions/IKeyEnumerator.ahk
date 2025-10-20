#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IKeyEnumerator extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
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
        result := ComCall(4, this, "ptr", key, "ptr*", value, "ptr*", metadata, "HRESULT")
        return result
    }
}

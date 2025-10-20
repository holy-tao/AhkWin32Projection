#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelIterator
     * @type {Guid}
     */
    static IID => Guid("{e4622136-927d-4490-874f-581f3e4e3688}")

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
     * @param {Pointer<IModelObject>} object 
     * @param {Integer} dimensions 
     * @param {Pointer<IModelObject>} indexers 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetNext(object, dimensions, indexers, metadata) {
        result := ComCall(4, this, "ptr*", object, "uint", dimensions, "ptr*", indexers, "ptr*", metadata, "HRESULT")
        return result
    }
}

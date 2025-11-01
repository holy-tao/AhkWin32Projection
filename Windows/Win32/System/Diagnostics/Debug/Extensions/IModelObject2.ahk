#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelObject2 extends IModelObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelObject2
     * @type {Guid}
     */
    static IID => Guid("{d61e19f4-ab3d-4344-9f7b-0993f3d58745}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateOwnKeyValues", "EnumerateOwnKeys", "EnumerateOwnKeyReferences"]

    /**
     * 
     * @param {Pointer<IKeyEnumerator>} ppEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateOwnKeyValues(ppEnumerator) {
        result := ComCall(36, this, "ptr*", ppEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IKeyEnumerator>} ppEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateOwnKeys(ppEnumerator) {
        result := ComCall(37, this, "ptr*", ppEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IKeyEnumerator>} ppEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateOwnKeyReferences(ppEnumerator) {
        result := ComCall(38, this, "ptr*", ppEnumerator, "HRESULT")
        return result
    }
}

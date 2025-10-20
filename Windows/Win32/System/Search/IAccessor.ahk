#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IAccessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessor
     * @type {Guid}
     */
    static IID => Guid("{0c733a8c-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRefAccessor", "CreateAccessor", "GetBindings", "ReleaseAccessor"]

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Integer>} pcRefCount 
     * @returns {HRESULT} 
     */
    AddRefAccessor(hAccessor, pcRefCount) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(3, this, "ptr", hAccessor, "uint*", pcRefCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAccessorFlags 
     * @param {Pointer} cBindings 
     * @param {Pointer<DBBINDING>} rgBindings 
     * @param {Pointer} cbRowSize 
     * @param {Pointer<HACCESSOR>} phAccessor 
     * @param {Pointer<Integer>} rgStatus 
     * @returns {HRESULT} 
     */
    CreateAccessor(dwAccessorFlags, cBindings, rgBindings, cbRowSize, phAccessor, rgStatus) {
        result := ComCall(4, this, "uint", dwAccessorFlags, "ptr", cBindings, "ptr", rgBindings, "ptr", cbRowSize, "ptr", phAccessor, "uint*", rgStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Integer>} pdwAccessorFlags 
     * @param {Pointer<Pointer>} pcBindings 
     * @param {Pointer<Pointer<DBBINDING>>} prgBindings 
     * @returns {HRESULT} 
     */
    GetBindings(hAccessor, pdwAccessorFlags, pcBindings, prgBindings) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(5, this, "ptr", hAccessor, "uint*", pdwAccessorFlags, "ptr*", pcBindings, "ptr*", prgBindings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Integer>} pcRefCount 
     * @returns {HRESULT} 
     */
    ReleaseAccessor(hAccessor, pcRefCount) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(6, this, "ptr", hAccessor, "uint*", pcRefCount, "HRESULT")
        return result
    }
}

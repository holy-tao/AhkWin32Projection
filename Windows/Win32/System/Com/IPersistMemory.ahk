#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistMemory extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistMemory
     * @type {Guid}
     */
    static IID => Guid("{bd1ae5e0-a6ae-11ce-bd37-504200c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "GetSizeMax", "InitNew"]

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    Load(pMem, cbSize) {
        pMemMarshal := pMem is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pMemMarshal, pMem, "uint", cbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fClearDirty 
     * @param {Integer} cbSize 
     * @returns {Void} 
     */
    Save(fClearDirty, cbSize) {
        result := ComCall(6, this, "ptr", &pMem := 0, "int", fClearDirty, "uint", cbSize, "HRESULT")
        return pMem
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSizeMax() {
        result := ComCall(7, this, "uint*", &pCbSize := 0, "HRESULT")
        return pCbSize
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}

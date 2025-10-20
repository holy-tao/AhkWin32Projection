#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistMemory extends IPersist{
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
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    Load(pMem, cbSize) {
        result := ComCall(5, this, "ptr", pMem, "uint", cbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @param {BOOL} fClearDirty 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    Save(pMem, fClearDirty, cbSize) {
        result := ComCall(6, this, "ptr", pMem, "int", fClearDirty, "uint", cbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCbSize 
     * @returns {HRESULT} 
     */
    GetSizeMax(pCbSize) {
        result := ComCall(7, this, "uint*", pCbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

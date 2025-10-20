#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IPersistMoniker extends IUnknown{
    /**
     * The interface identifier for IPersistMoniker
     * @type {Guid}
     */
    static IID => Guid("{79eac9c9-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pClassID 
     * @returns {HRESULT} 
     */
    GetClassID(pClassID) {
        result := ComCall(3, this, "ptr", pClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

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
     * @param {BOOL} fFullyAvailable 
     * @param {Pointer<IMoniker>} pimkName 
     * @param {Pointer<IBindCtx>} pibc 
     * @param {Integer} grfMode 
     * @returns {HRESULT} 
     */
    Load(fFullyAvailable, pimkName, pibc, grfMode) {
        result := ComCall(5, this, "int", fFullyAvailable, "ptr", pimkName, "ptr", pibc, "uint", grfMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pimkName 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {BOOL} fRemember 
     * @returns {HRESULT} 
     */
    Save(pimkName, pbc, fRemember) {
        result := ComCall(6, this, "ptr", pimkName, "ptr", pbc, "int", fRemember, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pimkName 
     * @param {Pointer<IBindCtx>} pibc 
     * @returns {HRESULT} 
     */
    SaveCompleted(pimkName, pibc) {
        result := ComCall(7, this, "ptr", pimkName, "ptr", pibc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} ppimkName 
     * @returns {HRESULT} 
     */
    GetCurMoniker(ppimkName) {
        result := ComCall(8, this, "ptr", ppimkName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

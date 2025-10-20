#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IPersistMoniker extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassID", "IsDirty", "Load", "Save", "SaveCompleted", "GetCurMoniker"]

    /**
     * 
     * @param {Pointer<Guid>} pClassID 
     * @returns {HRESULT} 
     */
    GetClassID(pClassID) {
        result := ComCall(3, this, "ptr", pClassID, "HRESULT")
        return result
    }

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
     * @param {BOOL} fFullyAvailable 
     * @param {IMoniker} pimkName 
     * @param {IBindCtx} pibc 
     * @param {Integer} grfMode 
     * @returns {HRESULT} 
     */
    Load(fFullyAvailable, pimkName, pibc, grfMode) {
        result := ComCall(5, this, "int", fFullyAvailable, "ptr", pimkName, "ptr", pibc, "uint", grfMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pimkName 
     * @param {IBindCtx} pbc 
     * @param {BOOL} fRemember 
     * @returns {HRESULT} 
     */
    Save(pimkName, pbc, fRemember) {
        result := ComCall(6, this, "ptr", pimkName, "ptr", pbc, "int", fRemember, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pimkName 
     * @param {IBindCtx} pibc 
     * @returns {HRESULT} 
     */
    SaveCompleted(pimkName, pibc) {
        result := ComCall(7, this, "ptr", pimkName, "ptr", pibc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} ppimkName 
     * @returns {HRESULT} 
     */
    GetCurMoniker(ppimkName) {
        result := ComCall(8, this, "ptr*", ppimkName, "HRESULT")
        return result
    }
}

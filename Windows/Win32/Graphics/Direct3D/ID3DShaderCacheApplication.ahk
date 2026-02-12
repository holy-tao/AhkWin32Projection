#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D_SHADER_CACHE_APPLICATION_DESC.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheApplication extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DShaderCacheApplication
     * @type {Guid}
     */
    static IID => Guid("{fc688ee2-1b35-4913-93be-1ca3fa7df39e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExePath", "GetDesc", "RegisterComponent", "RemoveComponent", "GetComponentCount", "GetComponent", "GetPrecompileTargetCount", "GetPrecompileTargets", "GetInstallerName"]

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetExePath() {
        result := ComCall(3, this, "ptr*", &pExePath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pExePath
    }

    /**
     * GetDescendant (Database Engine)
     * @remarks
     * Returns one child node that is a descendant of the parent.
     * -   If parent is NULL, returns NULL.  
     * -   If parent is not NULL, and both child1 and child2 are NULL, returns a child of parent.  
     * -   If parent and child1 are not NULL, and child2 is NULL, returns a child of parent greater than child1.  
     * -   If parent and child2 are not NULL and child1 is NULL, returns a child of parent less than child2.  
     * -   If parent, child1, and child2 are not NULL, returns a child of parent greater than child1 and less than child2.  
     * -   If child1 is not NULL and not a child of parent, an exception is raised.  
     * -   If child2 is not NULL and not a child of parent, an exception is raised.  
     * -   If child1 >= child2, an exception is raised.  
     *   
     * GetDescendant is deterministic. Therefore, if GetDescendant is called with the same inputs, it will always produce the same output. However, the exact identity of the child produced can vary depending upon its relationship to the other nodes, as demonstrated in example C.
     * @returns {D3D_SHADER_CACHE_APPLICATION_DESC} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/data-types/getdescendant-database-engine
     */
    GetDesc() {
        pApplicationDesc := D3D_SHADER_CACHE_APPLICATION_DESC()
        result := ComCall(4, this, "ptr", pApplicationDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pApplicationDesc
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pStateObjectDBPath 
     * @param {Integer} NumPSDB 
     * @param {Pointer<D3D_SHADER_CACHE_PSDB_PROPERTIES>} pPSDBs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    RegisterComponent(pName, pStateObjectDBPath, NumPSDB, pPSDBs, riid) {
        pName := pName is String ? StrPtr(pName) : pName
        pStateObjectDBPath := pStateObjectDBPath is String ? StrPtr(pStateObjectDBPath) : pStateObjectDBPath

        result := ComCall(5, this, "ptr", pName, "ptr", pStateObjectDBPath, "uint", NumPSDB, "ptr", pPSDBs, "ptr", riid, "ptr*", &ppvComponent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvComponent
    }

    /**
     * 
     * @param {ID3DShaderCacheComponent} pComponent 
     * @returns {HRESULT} 
     */
    RemoveComponent(pComponent) {
        result := ComCall(6, this, "ptr", pComponent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetComponentCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    GetComponent(index, riid) {
        result := ComCall(8, this, "uint", index, "ptr", riid, "ptr*", &ppvComponent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvComponent
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    GetPrecompileTargetCount(flags) {
        result := ComCall(9, this, "int", flags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ArraySize 
     * @param {Pointer<D3D_SHADER_CACHE_COMPILER_PROPERTIES>} pArray 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    GetPrecompileTargets(ArraySize, pArray, flags) {
        result := ComCall(10, this, "uint", ArraySize, "ptr", pArray, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetInstallerName() {
        result := ComCall(11, this, "ptr*", &pInstallerName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInstallerName
    }
}

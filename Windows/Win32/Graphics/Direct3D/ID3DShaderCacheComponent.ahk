#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheComponent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DShaderCacheComponent
     * @type {Guid}
     */
    static IID => Guid("{eed1bf00-f5c7-4cf7-885c-d0f9c0cb4828}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetComponentName", "GetStateObjectDatabasePath", "GetPrecompiledCachePath", "GetPrecompiledShaderDatabaseCount", "GetPrecompiledShaderDatabases"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pName 
     * @returns {HRESULT} 
     */
    GetComponentName(pName) {
        pNameMarshal := pName is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pNameMarshal, pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pPath 
     * @returns {HRESULT} 
     */
    GetStateObjectDatabasePath(pPath) {
        pPathMarshal := pPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pPathMarshal, pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAdapterFamily 
     * @param {Pointer<Pointer<Integer>>} pPath 
     * @returns {HRESULT} 
     */
    GetPrecompiledCachePath(pAdapterFamily, pPath) {
        pAdapterFamily := pAdapterFamily is String ? StrPtr(pAdapterFamily) : pAdapterFamily

        pPathMarshal := pPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pAdapterFamily, pPathMarshal, pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPrecompiledShaderDatabaseCount() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ArraySize 
     * @param {Pointer<D3D_SHADER_CACHE_PSDB_PROPERTIES>} pPSDBs 
     * @returns {HRESULT} 
     */
    GetPrecompiledShaderDatabases(ArraySize, pPSDBs) {
        result := ComCall(7, this, "uint", ArraySize, "ptr", pPSDBs, "HRESULT")
        return result
    }
}

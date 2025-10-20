#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DShaderCacheComponent extends IUnknown{
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
     * 
     * @param {Pointer<UInt16>} pName 
     * @returns {HRESULT} 
     */
    GetComponentName(pName) {
        result := ComCall(3, this, "ushort*", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pPath 
     * @returns {HRESULT} 
     */
    GetStateObjectDatabasePath(pPath) {
        result := ComCall(4, this, "ushort*", pPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAdapterFamily 
     * @param {Pointer<UInt16>} pPath 
     * @returns {HRESULT} 
     */
    GetPrecompiledCachePath(pAdapterFamily, pPath) {
        pAdapterFamily := pAdapterFamily is String ? StrPtr(pAdapterFamily) : pAdapterFamily

        result := ComCall(5, this, "ptr", pAdapterFamily, "ushort*", pPath, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(7, this, "uint", ArraySize, "ptr", pPSDBs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

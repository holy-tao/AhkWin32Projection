#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetSecurityManagerEx.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetSecurityManagerEx2 extends IInternetSecurityManagerEx{
    /**
     * The interface identifier for IInternetSecurityManagerEx2
     * @type {Guid}
     */
    static IID => Guid("{f1e50292-a795-4117-8e09-2b560a72ac60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<IUri>} pUri 
     * @param {Pointer<UInt32>} pdwZone 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} ppwszMappedUrl 
     * @param {Pointer<UInt32>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    MapUrlToZoneEx2(pUri, pdwZone, dwFlags, ppwszMappedUrl, pdwOutFlags) {
        result := ComCall(12, this, "ptr", pUri, "uint*", pdwZone, "uint", dwFlags, "ptr", ppwszMappedUrl, "uint*", pdwOutFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pUri 
     * @param {Integer} dwAction 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Byte>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @param {Pointer<UInt32>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    ProcessUrlActionEx2(pUri, dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved, pdwOutFlags) {
        result := ComCall(13, this, "ptr", pUri, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "char*", pContext, "uint", cbContext, "uint", dwFlags, "ptr", dwReserved, "uint*", pdwOutFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pUri 
     * @param {Pointer<Byte>} pbSecurityId 
     * @param {Pointer<UInt32>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSecurityIdEx2(pUri, pbSecurityId, pcbSecurityId, dwReserved) {
        result := ComCall(14, this, "ptr", pUri, "char*", pbSecurityId, "uint*", pcbSecurityId, "ptr", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pUri 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} ppPolicy 
     * @param {Pointer<UInt32>} pcbPolicy 
     * @param {Pointer<Byte>} pContext 
     * @param {Integer} cbContext 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicyEx2(pUri, guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        result := ComCall(15, this, "ptr", pUri, "ptr", guidKey, "char*", ppPolicy, "uint*", pcbPolicy, "char*", pContext, "uint", cbContext, "ptr", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

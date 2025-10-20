#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IUrlMon extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUrlMon
     * @type {Guid}
     */
    static IID => Guid("{00000026-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AsyncGetClassBits"]

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pszTYPE 
     * @param {PWSTR} pszExt 
     * @param {Integer} dwFileVersionMS 
     * @param {Integer} dwFileVersionLS 
     * @param {PWSTR} pszCodeBase 
     * @param {IBindCtx} pbc 
     * @param {Integer} dwClassContext 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    AsyncGetClassBits(rclsid, pszTYPE, pszExt, dwFileVersionMS, dwFileVersionLS, pszCodeBase, pbc, dwClassContext, riid, flags) {
        pszTYPE := pszTYPE is String ? StrPtr(pszTYPE) : pszTYPE
        pszExt := pszExt is String ? StrPtr(pszExt) : pszExt
        pszCodeBase := pszCodeBase is String ? StrPtr(pszCodeBase) : pszCodeBase

        result := ComCall(3, this, "ptr", rclsid, "ptr", pszTYPE, "ptr", pszExt, "uint", dwFileVersionMS, "uint", dwFileVersionLS, "ptr", pszCodeBase, "ptr", pbc, "uint", dwClassContext, "ptr", riid, "uint", flags, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSAdminBase2W.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IMSAdminBase3W extends IMSAdminBase2W{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSAdminBase3W
     * @type {Guid}
     */
    static IID => Guid("{f612954d-3b0b-4c56-9563-227b7be624b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChildPaths"]

    /**
     * 
     * @param {Integer} hMDHandle 
     * @param {PWSTR} pszMDPath 
     * @param {Integer} cchMDBufferSize 
     * @param {PWSTR} pszBuffer 
     * @param {Pointer<Integer>} pcchMDRequiredBufferSize 
     * @returns {HRESULT} 
     */
    GetChildPaths(hMDHandle, pszMDPath, cchMDBufferSize, pszBuffer, pcchMDRequiredBufferSize) {
        pszMDPath := pszMDPath is String ? StrPtr(pszMDPath) : pszMDPath
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        pcchMDRequiredBufferSizeMarshal := pcchMDRequiredBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, "uint", hMDHandle, "ptr", pszMDPath, "uint", cchMDBufferSize, "ptr", pszBuffer, pcchMDRequiredBufferSizeMarshal, pcchMDRequiredBufferSize, "HRESULT")
        return result
    }
}

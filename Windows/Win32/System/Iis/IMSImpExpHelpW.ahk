#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IMSImpExpHelpW extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSImpExpHelpW
     * @type {Guid}
     */
    static IID => Guid("{29ff67ff-8050-480f-9f30-cc41635f2f9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumeratePathsInFile"]

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {PWSTR} pszKeyType 
     * @param {Integer} dwMDBufferSize 
     * @param {PWSTR} pszBuffer 
     * @returns {Integer} 
     */
    EnumeratePathsInFile(pszFileName, pszKeyType, dwMDBufferSize, pszBuffer) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName
        pszKeyType := pszKeyType is String ? StrPtr(pszKeyType) : pszKeyType
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(3, this, "ptr", pszFileName, "ptr", pszKeyType, "uint", dwMDBufferSize, "ptr", pszBuffer, "uint*", &pdwMDRequiredBufferSize := 0, "HRESULT")
        return pdwMDRequiredBufferSize
    }
}

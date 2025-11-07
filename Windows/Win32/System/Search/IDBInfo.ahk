#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a89-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKeywords", "GetLiteralInfo"]

    /**
     * 
     * @returns {PWSTR} 
     */
    GetKeywords() {
        result := ComCall(3, this, "ptr*", &ppwszKeywords := 0, "HRESULT")
        return ppwszKeywords
    }

    /**
     * 
     * @param {Integer} cLiterals 
     * @param {Pointer<Integer>} rgLiterals 
     * @param {Pointer<Integer>} pcLiteralInfo 
     * @param {Pointer<Pointer<DBLITERALINFO>>} prgLiteralInfo 
     * @param {Pointer<Pointer<Integer>>} ppCharBuffer 
     * @returns {HRESULT} 
     */
    GetLiteralInfo(cLiterals, rgLiterals, pcLiteralInfo, prgLiteralInfo, ppCharBuffer) {
        rgLiteralsMarshal := rgLiterals is VarRef ? "uint*" : "ptr"
        pcLiteralInfoMarshal := pcLiteralInfo is VarRef ? "uint*" : "ptr"
        prgLiteralInfoMarshal := prgLiteralInfo is VarRef ? "ptr*" : "ptr"
        ppCharBufferMarshal := ppCharBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cLiterals, rgLiteralsMarshal, rgLiterals, pcLiteralInfoMarshal, pcLiteralInfo, prgLiteralInfoMarshal, prgLiteralInfo, ppCharBufferMarshal, ppCharBuffer, "HRESULT")
        return result
    }
}

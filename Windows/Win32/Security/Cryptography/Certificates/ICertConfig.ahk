#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICertConfig interface provides functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertconfig
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertConfig extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertConfig
     * @type {Guid}
     */
    static IID => Guid("{372fce34-4324-11d0-8810-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "GetField", "GetConfig"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-reset
     */
    Reset(Index, pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", Index, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strFieldName 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getfield
     */
    GetField(strFieldName, pstrOut) {
        strFieldName := strFieldName is String ? BSTR.Alloc(strFieldName).Value : strFieldName

        result := ComCall(9, this, "ptr", strFieldName, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getconfig
     */
    GetConfig(Flags, pstrOut) {
        result := ComCall(10, this, "int", Flags, "ptr", pstrOut, "HRESULT")
        return result
    }
}

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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-reset
     */
    Reset(Index) {
        result := ComCall(7, this, "int", Index, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-next
     */
    Next() {
        result := ComCall(8, this, "int*", &pIndex := 0, "HRESULT")
        return pIndex
    }

    /**
     * 
     * @param {BSTR} strFieldName 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getfield
     */
    GetField(strFieldName) {
        strFieldName := strFieldName is String ? BSTR.Alloc(strFieldName).Value : strFieldName

        pstrOut := BSTR()
        result := ComCall(9, this, "ptr", strFieldName, "ptr", pstrOut, "HRESULT")
        return pstrOut
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig-getconfig
     */
    GetConfig(Flags) {
        pstrOut := BSTR()
        result := ComCall(10, this, "int", Flags, "ptr", pstrOut, "HRESULT")
        return pstrOut
    }
}

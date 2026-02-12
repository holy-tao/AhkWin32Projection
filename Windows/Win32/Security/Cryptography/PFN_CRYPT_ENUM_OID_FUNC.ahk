#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The CRYPT_ENUM_OID_FUNCTION callback function is used with the CryptEnumOIDFunction function.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/nc-wincrypt-pfn_crypt_enum_oid_func
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_ENUM_OID_FUNC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} dwEncodingType 
     * @param {PSTR} pszFuncName 
     * @param {PSTR} pszOID 
     * @param {Integer} cValue 
     * @param {Pointer<Integer>} rgdwValueType 
     * @param {Pointer<PWSTR>} rgpwszValueName 
     * @param {Pointer<Pointer<Integer>>} rgpbValueData 
     * @param {Pointer<Integer>} rgcbValueData 
     * @param {Pointer<Void>} pvArg 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwEncodingType, pszFuncName, pszOID, cValue, rgdwValueType, rgpwszValueName, rgpbValueData, rgcbValueData, pvArg) {
        pszFuncName := pszFuncName is String ? StrPtr(pszFuncName) : pszFuncName
        pszOID := pszOID is String ? StrPtr(pszOID) : pszOID

        rgdwValueTypeMarshal := rgdwValueType is VarRef ? "uint*" : "ptr"
        rgpwszValueNameMarshal := rgpwszValueName is VarRef ? "ptr*" : "ptr"
        rgpbValueDataMarshal := rgpbValueData is VarRef ? "ptr*" : "ptr"
        rgcbValueDataMarshal := rgcbValueData is VarRef ? "uint*" : "ptr"
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwEncodingType, "ptr", pszFuncName, "ptr", pszOID, "uint", cValue, rgdwValueTypeMarshal, rgdwValueType, rgpwszValueNameMarshal, rgpwszValueName, rgpbValueDataMarshal, rgpbValueData, rgcbValueDataMarshal, rgcbValueData, pvArgMarshal, pvArg, "int")
        return result
    }
}

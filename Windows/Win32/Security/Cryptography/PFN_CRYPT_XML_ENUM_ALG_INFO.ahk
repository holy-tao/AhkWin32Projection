#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates predefined and registered CRYPT_XML_ALGORITHM_INFO entries.
 * @remarks
 * If the callback function returns <b>FALSE</b>, then stop the enumeration.
 * 
 *  This function enumerates  either the predefined and registered 
 *  entries or the structures identified by a selected URI group.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-pfn_crypt_xml_enum_alg_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_XML_ENUM_ALG_INFO extends IUnknown {

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
     * @param {Pointer<CRYPT_XML_ALGORITHM_INFO>} pInfo 
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
    Invoke(pInfo, pvArg) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pInfo, pvArgMarshal, pvArg, "int")
        return result
    }
}

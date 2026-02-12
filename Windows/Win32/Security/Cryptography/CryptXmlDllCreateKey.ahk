#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BCRYPT_KEY_HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Parses the KeyValue element and creates a Cryptography API:\_Next Generation (CNG) BCrypt key handle to verify a signature.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-cryptxmldllcreatekey
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CryptXmlDllCreateKey extends IUnknown {

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
     * @param {Pointer<CRYPT_XML_BLOB>} pEncoded 
     * @returns {BCRYPT_KEY_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pEncoded) {
        phKey := BCRYPT_KEY_HANDLE()
        result := ComCall(3, this, "ptr", pEncoded, "ptr", phKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phKey
    }
}

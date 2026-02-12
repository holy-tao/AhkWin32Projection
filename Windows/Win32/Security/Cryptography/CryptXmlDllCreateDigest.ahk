#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a digest object for the specified method.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-cryptxmldllcreatedigest
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CryptXmlDllCreateDigest extends IUnknown {

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
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pDigestMethod 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pDigestMethod, pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pDigestMethod, pcbSizeMarshal, pcbSize, "ptr*", &phDigest := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDigest
    }
}

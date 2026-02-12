#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CRYPT_XML_CRYPTOGRAPHIC_INTERFACE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves a pointer to the cryptographic extension functions for the specified algorithm.
 * @remarks
 * The cryptographic extensions DLL must export the <b>CryptXmlDllGetInterface</b> entry.
 * 
 * 
 * To get the <a href="https://docs.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_cryptographic_interface">CRYPT_XML_CRYPTOGRAPHIC_INTERFACE</a>  table, CryptXml loads the registered cryptographic extensions DLL by using the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function, and then it calls the
 * <b>CryptXmlDllGetInterface</b> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-cryptxmldllgetinterface
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CryptXmlDllGetInterface extends IUnknown {

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
     * @param {Integer} dwFlags 
     * @param {Pointer<CRYPT_XML_ALGORITHM_INFO>} pMethod 
     * @returns {CRYPT_XML_CRYPTOGRAPHIC_INTERFACE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwFlags, pMethod) {
        pInterface := CRYPT_XML_CRYPTOGRAPHIC_INTERFACE()
        result := ComCall(3, this, "uint", dwFlags, "ptr", pMethod, "ptr", pInterface, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInterface
    }
}

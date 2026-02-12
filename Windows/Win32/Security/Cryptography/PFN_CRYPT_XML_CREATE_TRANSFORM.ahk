#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CRYPT_XML_DATA_PROVIDER.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a transform for a specified data provider.
 * @remarks
 * In the transform chain, the output of a transform is the input of the next transform in the chain.
 * 
 *  The implementation of the callback function is responsible for calling the  provider close function on the input transform to release the input provider.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptxml/nc-cryptxml-pfn_crypt_xml_create_transform
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PFN_CRYPT_XML_CREATE_TRANSFORM extends IUnknown {

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
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pTransform 
     * @param {Pointer<CRYPT_XML_DATA_PROVIDER>} pProviderIn 
     * @returns {CRYPT_XML_DATA_PROVIDER} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pTransform, pProviderIn) {
        pProviderOut := CRYPT_XML_DATA_PROVIDER()
        result := ComCall(3, this, "ptr", pTransform, "ptr", pProviderIn, "ptr", pProviderOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pProviderOut
    }
}

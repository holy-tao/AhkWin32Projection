#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SslEncryptPacketFn extends IUnknown {

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
     * @param {NCRYPT_PROV_HANDLE} hSslProvider 
     * @param {NCRYPT_KEY_HANDLE} hKey_ 
     * @param {Pointer} pbInput 
     * @param {Integer} cbInput 
     * @param {Pointer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} SequenceNumber 
     * @param {Integer} dwContentType 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSslProvider, hKey_, pbInput, cbInput, pbOutput, cbOutput, SequenceNumber, dwContentType, dwFlags) {
        hSslProvider := hSslProvider is Win32Handle ? NumGet(hSslProvider, "ptr") : hSslProvider
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_

        result := ComCall(3, this, "ptr", hSslProvider, "ptr", hKey_, "ptr", pbInput, "uint", cbInput, "ptr", pbOutput, "uint", cbOutput, "uint*", &pcbResult := 0, "uint", SequenceNumber, "uint", dwContentType, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbResult
    }
}

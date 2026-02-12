#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCryptExportKeyFn extends IUnknown {

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
     * @param {NCRYPT_PROV_HANDLE} hProvider_ 
     * @param {NCRYPT_KEY_HANDLE} hKey_ 
     * @param {NCRYPT_KEY_HANDLE} hExportKey 
     * @param {PWSTR} pszBlobType 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Pointer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProvider_, hKey_, hExportKey, pszBlobType, pParameterList, pbOutput, cbOutput, dwFlags) {
        hProvider_ := hProvider_ is Win32Handle ? NumGet(hProvider_, "ptr") : hProvider_
        hKey_ := hKey_ is Win32Handle ? NumGet(hKey_, "ptr") : hKey_
        hExportKey := hExportKey is Win32Handle ? NumGet(hExportKey, "ptr") : hExportKey
        pszBlobType := pszBlobType is String ? StrPtr(pszBlobType) : pszBlobType

        result := ComCall(3, this, "ptr", hProvider_, "ptr", hKey_, "ptr", hExportKey, "ptr", pszBlobType, "ptr", pParameterList, "ptr", pbOutput, "uint", cbOutput, "uint*", &pcbResult := 0, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbResult
    }
}

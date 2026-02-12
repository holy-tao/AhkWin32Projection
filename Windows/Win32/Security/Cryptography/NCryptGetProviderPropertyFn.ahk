#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCryptGetProviderPropertyFn extends IUnknown {

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
     * @param {PWSTR} pszProperty 
     * @param {Pointer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hProvider_, pszProperty, pbOutput, cbOutput, dwFlags) {
        hProvider_ := hProvider_ is Win32Handle ? NumGet(hProvider_, "ptr") : hProvider_
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        result := ComCall(3, this, "ptr", hProvider_, "ptr", pszProperty, "ptr", pbOutput, "uint", cbOutput, "uint*", &pcbResult := 0, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbResult
    }
}

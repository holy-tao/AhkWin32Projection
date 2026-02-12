#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCryptGetPropertyFn extends IUnknown {

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
     * @param {BCRYPT_HANDLE} hObject 
     * @param {PWSTR} pszProperty 
     * @param {Pointer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hObject, pszProperty, pbOutput, cbOutput, pcbResult, dwFlags) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hObject, "ptr", pszProperty, "ptr", pbOutput, "uint", cbOutput, pcbResultMarshal, pcbResult, "uint", dwFlags, "int")
        return result
    }
}

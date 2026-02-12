#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_OPEN_SAM_USER extends IUnknown {

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
     * @param {Pointer<SECURITY_STRING>} Name 
     * @param {Integer} NameType 
     * @param {Pointer<SECURITY_STRING>} Prefix 
     * @param {BOOLEAN} AllowGuest 
     * @param {Integer} Reserved 
     * @param {Pointer<Pointer<Void>>} UserHandle 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Name, NameType, Prefix, AllowGuest, Reserved, UserHandle) {
        UserHandleMarshal := UserHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Name, "int", NameType, "ptr", Prefix, "char", AllowGuest, "uint", Reserved, UserHandleMarshal, UserHandle, "int")
        return result
    }
}

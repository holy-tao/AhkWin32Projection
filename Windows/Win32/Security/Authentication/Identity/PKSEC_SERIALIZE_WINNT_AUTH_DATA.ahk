#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PKSEC_SERIALIZE_WINNT_AUTH_DATA extends IUnknown {

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
     * @param {Pointer<Void>} pvAuthData 
     * @param {Pointer<Integer>} Size_ 
     * @param {Pointer<Pointer<Void>>} SerializedData 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvAuthData, Size_, SerializedData) {
        pvAuthDataMarshal := pvAuthData is VarRef ? "ptr" : "ptr"
        Size_Marshal := Size_ is VarRef ? "uint*" : "ptr"
        SerializedDataMarshal := SerializedData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pvAuthDataMarshal, pvAuthData, Size_Marshal, Size_, SerializedDataMarshal, SerializedData, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN extends IUnknown {

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
     * @param {Pointer} UserAuthData 
     * @param {Integer} UserAuthDataSize 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Pointer<Integer>>} ExpandedAuthData 
     * @param {Pointer<Integer>} ExpandedAuthDataSize 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(UserAuthData, UserAuthDataSize, Reserved, ExpandedAuthData, ExpandedAuthDataSize) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        ExpandedAuthDataMarshal := ExpandedAuthData is VarRef ? "ptr*" : "ptr"
        ExpandedAuthDataSizeMarshal := ExpandedAuthDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", UserAuthData, "uint", UserAuthDataSize, ReservedMarshal, Reserved, ExpandedAuthDataMarshal, ExpandedAuthData, ExpandedAuthDataSizeMarshal, ExpandedAuthDataSize, "int")
        return result
    }
}

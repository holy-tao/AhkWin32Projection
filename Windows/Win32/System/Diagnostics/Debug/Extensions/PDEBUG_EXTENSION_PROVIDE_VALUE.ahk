#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PDEBUG_EXTENSION_PROVIDE_VALUE extends IUnknown {

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
     * @param {IDebugClient} Client 
     * @param {Integer} Flags 
     * @param {PWSTR} Name 
     * @param {Pointer<Integer>} Value 
     * @param {Pointer<Integer>} TypeModBase 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} TypeFlags_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Client, Flags, Name, Value, TypeModBase, TypeId, TypeFlags_) {
        Name := Name is String ? StrPtr(Name) : Name

        ValueMarshal := Value is VarRef ? "uint*" : "ptr"
        TypeModBaseMarshal := TypeModBase is VarRef ? "uint*" : "ptr"
        TypeIdMarshal := TypeId is VarRef ? "uint*" : "ptr"
        TypeFlags_Marshal := TypeFlags_ is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Client, "uint", Flags, "ptr", Name, ValueMarshal, Value, TypeModBaseMarshal, TypeModBase, TypeIdMarshal, TypeId, TypeFlags_Marshal, TypeFlags_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

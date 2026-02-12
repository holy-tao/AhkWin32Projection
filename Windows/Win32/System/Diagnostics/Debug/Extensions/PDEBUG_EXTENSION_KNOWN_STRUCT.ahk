#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PDEBUG_EXTENSION_KNOWN_STRUCT extends IUnknown {

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
     * @param {Integer} Flags 
     * @param {Integer} Offset 
     * @param {PSTR} TypeName 
     * @param {PSTR} Buffer_ 
     * @param {Pointer<Integer>} BufferChars 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Flags, Offset, TypeName, Buffer_, BufferChars) {
        TypeName := TypeName is String ? StrPtr(TypeName) : TypeName
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        BufferCharsMarshal := BufferChars is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", Flags, "uint", Offset, "ptr", TypeName, "ptr", Buffer_, BufferCharsMarshal, BufferChars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

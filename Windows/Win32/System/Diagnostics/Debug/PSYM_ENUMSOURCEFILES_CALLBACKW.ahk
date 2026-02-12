#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PSYM_ENUMSOURCEFILES_CALLBACKW (Unicode) is an application-defined callback function used with the SymEnumSourceFiles function.
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-psym_enumsourcefiles_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class PSYM_ENUMSOURCEFILES_CALLBACKW extends IUnknown {

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
     * @param {Pointer<SOURCEFILEW>} pSourceFile 
     * @param {Pointer<Void>} UserContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pSourceFile, UserContext) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pSourceFile, UserContextMarshal, UserContext, "int")
        return result
    }
}

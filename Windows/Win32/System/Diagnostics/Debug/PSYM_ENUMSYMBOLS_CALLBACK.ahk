#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PSYM_ENUMSYMBOLS_CALLBACK (dbghelp.h) is an application-defined callback function used with the SymEnumerateSymbols64 function.
 * @remarks
 * The calling application is called once per symbol until all the symbols are enumerated or until the enumeration callback function returns <b>FALSE</b>.
 * 
 * This callback function supersedes the <i>PSYM_ENUMSYMBOLS_CALLBACK</i> callback function.  <i>PSYM_ENUMSYMBOLS_CALLBACK</i> is defined as follows in Dbghelp.h.
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-psym_enumsymbols_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class PSYM_ENUMSYMBOLS_CALLBACK extends IUnknown {

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
     * @param {PSTR} SymbolName 
     * @param {Integer} SymbolAddress 
     * @param {Integer} SymbolSize 
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
    Invoke(SymbolName, SymbolAddress, SymbolSize, UserContext) {
        SymbolName := SymbolName is String ? StrPtr(SymbolName) : SymbolName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", SymbolName, "uint", SymbolAddress, "uint", SymbolSize, UserContextMarshal, UserContext, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PSYM_ENUMERATESYMBOLS_CALLBACKW (Unicode) is a callback function used with the SymEnumSymbols, SymEnumTypes, and SymEnumTypesByName functions.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines PSYM_ENUMERATESYMBOLS_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-psym_enumeratesymbols_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class PSYM_ENUMERATESYMBOLS_CALLBACKW extends IUnknown {

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
     * @param {Pointer<SYMBOL_INFOW>} pSymInfo 
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
    Invoke(pSymInfo, SymbolSize, UserContext) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pSymInfo, "uint", SymbolSize, UserContextMarshal, UserContext, "int")
        return result
    }
}

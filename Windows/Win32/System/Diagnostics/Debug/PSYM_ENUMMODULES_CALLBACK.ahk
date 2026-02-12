#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PSYM_ENUMMODULES_CALLBACK (dbghelp.h) is an application-defined callback function used with the SymEnumerateModules64 function.
 * @remarks
 * The calling application is called once per module until all modules are enumerated, or until the enumeration callback function returns <b>FALSE</b>.
 * 
 * This callback function supersedes the <i>PSYM_ENUMMODULES_CALLBACK</i> callback function.  <i>PSYM_ENUMMODULES_CALLBACK</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-psym_enummodules_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PSYM_ENUMMODULES_CALLBACK extends IUnknown {

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
     * @param {PSTR} ModuleName 
     * @param {Integer} BaseOfDll 
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
    Invoke(ModuleName, BaseOfDll, UserContext) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", ModuleName, "uint", BaseOfDll, UserContextMarshal, UserContext, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PENUMLOADED_MODULES_CALLBACKW64 (Unicode) is an application-defined callback function used with the EnumerateLoadedModules64 function.
 * @remarks
 * This callback function supersedes the <i>PENUMLOADED_MODULES_CALLBACK</i> callback function. <i>PENUMLOADED_MODULES_CALLBACK</i> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-penumloaded_modules_callbackw64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PENUMLOADED_MODULES_CALLBACKW64 extends IUnknown {

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
     * @param {PWSTR} ModuleName 
     * @param {Integer} ModuleBase 
     * @param {Integer} ModuleSize 
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
    Invoke(ModuleName, ModuleBase, ModuleSize, UserContext) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", ModuleName, "uint", ModuleBase, "uint", ModuleSize, UserContextMarshal, UserContext, "int")
        return result
    }
}

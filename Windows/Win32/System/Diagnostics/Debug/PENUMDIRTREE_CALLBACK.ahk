#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PENUMDIRTREE_CALLBACK (dbghelp.h) is an application-defined callback function used with the EnumDirTree function. It is called every time a match is found.
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-penumdirtree_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class PENUMDIRTREE_CALLBACK extends IUnknown {

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
     * @param {PSTR} FilePath 
     * @param {Pointer<Void>} CallerData 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FilePath, CallerData) {
        FilePath := FilePath is String ? StrPtr(FilePath) : FilePath

        CallerDataMarshal := CallerData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", FilePath, CallerDataMarshal, CallerData, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PFIND_DEBUG_FILE_CALLBACK (dbghelp.h) is an application-defined callback function used with the FindDebugInfoFileEx function.
 * @remarks
 * One way to verify the symbol file is to compare its timestamp to the timestamp in the image. To retrieve the timestamp of the image, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-gettimestampforloadedlibrary">GetTimestampForLoadedLibrary</a> function. To retrieve the timestamp of the symbol file, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetmoduleinfo">SymGetModuleInfo64</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-pfind_debug_file_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class PFIND_DEBUG_FILE_CALLBACK extends IUnknown {

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
     * @param {HANDLE} FileHandle 
     * @param {PSTR} FileName 
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
    Invoke(FileHandle, FileName, CallerData) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        FileName := FileName is String ? StrPtr(FileName) : FileName

        CallerDataMarshal := CallerData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", FileHandle, "ptr", FileName, CallerDataMarshal, CallerData, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * PFIND_EXE_FILE_CALLBACKW (Unicode) is an application-defined callback function used with the FindExecutableImageEx function. It verifies whether the executable file found by FindExecutableImageEx is the correct executable file.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines PFIND_EXE_FILE_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nc-dbghelp-pfind_exe_file_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class PFIND_EXE_FILE_CALLBACKW extends IUnknown {

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
     * @param {PWSTR} FileName 
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

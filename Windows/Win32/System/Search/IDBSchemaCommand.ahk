#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICommand.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBSchemaCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBSchemaCommand
     * @type {Guid}
     */
    static IID => Guid("{0c733a50-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCommand", "GetSchemas"]

    /**
     * Retrieves the command-line string for the current process. (Unicode)
     * @remarks
     * The lifetime of the returned value is managed by the system, applications should not free or modify this value.
     * 
     * Console processes can use the <i>argc</i> and <i>argv</i> arguments of the <b>main</b> or <b>wmain</b> functions by implementing those as the program entry point.
     * GUI processes can use the <i>lpCmdLine</i> argument of the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-winmain">WinMain</a> or wWinMain functions by implementing those as the program entry point.
     * 
     * To convert the command line to an <i>argv</i> style array of strings, pass the result from GetCommandLineW to
     * <a href="https://docs.microsoft.com/windows/win32/api/shellapi/nf-shellapi-commandlinetoargvw">CommandLineToArgvW</a>.
     * 
     * <div class="alert"><b>Note</b>  The name of the executable in the command line that the operating system provides to a process is not necessarily identical to that in the command line that the calling process gives to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function. The operating system may prepend a fully qualified path to an executable name that is provided without a fully qualified path.</div>
     * <div> </div>
     * 
     * > [!NOTE]
     * > The processenv.h header defines GetCommandLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} rguidSchema 
     * @returns {ICommand} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processenv/nf-processenv-getcommandlinew
     */
    GetCommand(pUnkOuter, rguidSchema) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", rguidSchema, "ptr*", &ppCommand := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICommand(ppCommand)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcSchemas 
     * @returns {Pointer<Guid>} 
     */
    GetSchemas(pcSchemas) {
        pcSchemasMarshal := pcSchemas is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcSchemasMarshal, pcSchemas, "ptr*", &prgSchemas := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prgSchemas
    }
}

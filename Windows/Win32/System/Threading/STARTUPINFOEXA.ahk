#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\STARTUPINFOA.ahk" { STARTUPINFOA }
#Import ".\STARTUPINFOW_FLAGS.ahk" { STARTUPINFOW_FLAGS }
#Import ".\LPPROC_THREAD_ATTRIBUTE_LIST.ahk" { LPPROC_THREAD_ATTRIBUTE_LIST }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Specifies the window station, desktop, standard handles, and attributes for a new process. It is used with the CreateProcess and CreateProcessAsUser functions. (ANSI)
 * @remarks
 * Be sure to set the <b>cb</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure to <c>sizeof(STARTUPINFOEX)</c>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winbase.h header defines STARTUPINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-startupinfoexa
 * @namespace Windows.Win32.System.Threading
 * @charset ANSI
 */
export default struct STARTUPINFOEXA {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure.
     */
    StartupInfo : STARTUPINFOA

    /**
     * An attribute list. This list is created by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist">InitializeProcThreadAttributeList</a> function.
     */
    lpAttributeList : LPPROC_THREAD_ATTRIBUTE_LIST

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\STARTUPINFOW.ahk
#Include .\LPPROC_THREAD_ATTRIBUTE_LIST.ahk

/**
 * Specifies the window station, desktop, standard handles, and attributes for a new process. It is used with the CreateProcess and CreateProcessAsUser functions.
 * @remarks
 * 
  * Be sure to set the <b>cb</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure to <c>sizeof(STARTUPINFOEX)</c>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winbase.h header defines STARTUPINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-startupinfoexw
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 * @charset Unicode
 */
class STARTUPINFOEXW extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure.
     * @type {STARTUPINFOW}
     */
    StartupInfo{
        get {
            if(!this.HasProp("__StartupInfo"))
                this.__StartupInfo := STARTUPINFOW(0, this)
            return this.__StartupInfo
        }
    }

    /**
     * An attribute list. This list is created by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist">InitializeProcThreadAttributeList</a> function.
     * @type {LPPROC_THREAD_ATTRIBUTE_LIST}
     */
    lpAttributeList{
        get {
            if(!this.HasProp("__lpAttributeList"))
                this.__lpAttributeList := LPPROC_THREAD_ATTRIBUTE_LIST(104, this)
            return this.__lpAttributeList
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies the ServiceMain function for a service that can run in the calling process. It is used by the StartServiceCtrlDispatcher function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winsvc.h header defines SERVICE_TABLE_ENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_table_entryw
 * @namespace Windows.Win32.System.Services
 * @charset Unicode
 */
export default struct SERVICE_TABLE_ENTRYW {
    #StructPack 8

    /**
     * The name of a service to be run in this service process.  
     * 
     * If the service is installed with the  SERVICE_WIN32_OWN_PROCESS service type, this member is ignored, but cannot be NULL. This member can be an empty string ("").
     * 
     * If the service is installed with the SERVICE_WIN32_SHARE_PROCESS service type, this member specifies the name of the service that uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function pointed to by the <b>lpServiceProc</b> member.
     */
    lpServiceName : PWSTR

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function.
     */
    lpServiceProc : IntPtr

}

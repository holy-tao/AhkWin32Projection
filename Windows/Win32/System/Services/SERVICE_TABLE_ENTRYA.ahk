#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the ServiceMain function for a service that can run in the calling process. It is used by the StartServiceCtrlDispatcher function. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The winsvc.h header defines SERVICE_TABLE_ENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_table_entrya
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset ANSI
 */
class SERVICE_TABLE_ENTRYA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The name of a service to be run in this service process.  
     * 
     * If the service is installed with the  SERVICE_WIN32_OWN_PROCESS service type, this member is ignored, but cannot be NULL. This member can be an empty string ("").
     * 
     * If the service is installed with the SERVICE_WIN32_SHARE_PROCESS service type, this member specifies the name of the service that uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function pointed to by the <b>lpServiceProc</b> member.
     * @type {Pointer<PSTR>}
     */
    lpServiceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function.
     * @type {Pointer<LPSERVICE_MAIN_FUNCTIONA>}
     */
    lpServiceProc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_RUNS_IN_PROCESS.ahk" { SERVICE_RUNS_IN_PROCESS }
#Import ".\SERVICE_STATUS_PROCESS.ahk" { SERVICE_STATUS_PROCESS }
#Import ".\ENUM_SERVICE_TYPE.ahk" { ENUM_SERVICE_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\SERVICE_STATUS_CURRENT_STATE.ahk" { SERVICE_STATUS_CURRENT_STATE }

/**
 * Contains the name of a service in a service control manager database and information about the service. It is used by the EnumServicesStatusEx function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winsvc.h header defines ENUM_SERVICE_STATUS_PROCESS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-enum_service_status_processa
 * @namespace Windows.Win32.System.Services
 * @charset ANSI
 */
export default struct ENUM_SERVICE_STATUS_PROCESSA {
    #StructPack 8

    /**
     * The name of a service in the service control manager database. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. A slash (/), backslash (\\), comma, and space are invalid service name characters.
     */
    lpServiceName : PSTR

    /**
     * A display name that can be used by service control programs, such as Services in Control Panel, to identify the service. This string has a maximum length of 256 characters. The case is preserved in the service control manager. Display name comparisons are always case-insensitive.
     */
    lpDisplayName : PSTR

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure that contains status information for the <b>lpServiceName</b> service.
     */
    ServiceStatusProcess : SERVICE_STATUS_PROCESS

}

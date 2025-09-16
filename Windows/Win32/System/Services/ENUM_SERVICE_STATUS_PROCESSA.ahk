#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_STATUS_PROCESS.ahk

/**
 * Contains the name of a service in a service control manager database and information about the service. It is used by the EnumServicesStatusEx function. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The winsvc.h header defines ENUM_SERVICE_STATUS_PROCESS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-enum_service_status_processa
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset ANSI
 */
class ENUM_SERVICE_STATUS_PROCESSA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The name of a service in the service control manager database. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. A slash (/), backslash (\\), comma, and space are invalid service name characters.
     * @type {Pointer<PSTR>}
     */
    lpServiceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A display name that can be used by service control programs, such as Services in Control Panel, to identify the service. This string has a maximum length of 256 characters. The case is preserved in the service control manager. Display name comparisons are always case-insensitive.
     * @type {Pointer<PSTR>}
     */
    lpDisplayName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure that contains status information for the <b>lpServiceName</b> service.
     * @type {SERVICE_STATUS_PROCESS}
     */
    ServiceStatusProcess{
        get {
            if(!this.HasProp("__ServiceStatusProcess"))
                this.__ServiceStatusProcess := SERVICE_STATUS_PROCESS(this.ptr + 16)
            return this.__ServiceStatusProcess
        }
    }
}

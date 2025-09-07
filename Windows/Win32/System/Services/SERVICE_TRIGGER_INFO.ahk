#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains trigger event information for a service. This structure is used by the ChangeServiceConfig2 and QueryServiceConfig2 functions.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_trigger_info
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_TRIGGER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of triggers in the array of <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_trigger">SERVICE_TRIGGER</a> structures pointed to by the <b>pTriggers</b> member.  
     * 
     * If this member is 0 in a <b>SERVICE_TRIGGER_INFO</b> structure passed to  <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>, all previously configured triggers are removed from the service. If the service has no triggers configured, <b>ChangeServiceConfig2</b>  fails with ERROR_INVALID_PARAMETER.
     * @type {Integer}
     */
    cTriggers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_trigger">SERVICE_TRIGGER</a> structures that specify the trigger events for the service. If the <b>cTriggers</b> member is 0, this member is not used.
     * @type {Pointer<SERVICE_TRIGGER>}
     */
    pTriggers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This member is reserved and must be NULL.
     * @type {Pointer<Byte>}
     */
    pReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

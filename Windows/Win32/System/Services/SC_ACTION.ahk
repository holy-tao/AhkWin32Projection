#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an action that the service control manager can perform.
 * @remarks
 * This structure is used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfig2a">QueryServiceConfig2</a> functions, in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_failure_actionsa">SERVICE_FAILURE_ACTIONS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-sc_action
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SC_ACTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The time to wait before performing the specified action, in milliseconds.
     * @type {Integer}
     */
    Delay {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

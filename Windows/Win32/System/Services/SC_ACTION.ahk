#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SC_ACTION_TYPE.ahk" { SC_ACTION_TYPE }

/**
 * Represents an action that the service control manager can perform.
 * @remarks
 * This structure is used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfig2a">QueryServiceConfig2</a> functions, in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_failure_actionsa">SERVICE_FAILURE_ACTIONS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-sc_action
 * @namespace Windows.Win32.System.Services
 */
export default struct SC_ACTION {
    #StructPack 4

    Type : SC_ACTION_TYPE

    /**
     * The time to wait before performing the specified action, in milliseconds.
     */
    Delay : UInt32

}

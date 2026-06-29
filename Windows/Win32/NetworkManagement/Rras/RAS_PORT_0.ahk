#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RAS_PORT_CONDITION.ahk" { RAS_PORT_CONDITION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The RAS_PORT_0 structure contains general information regarding a specific RAS port, such as port condition and port name. For more detailed information about a specific port, such as line speed or errors, see RAS_PORT_1.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_port_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_PORT_0 {
    #StructPack 8

    /**
     * Handle to the port.
     */
    hPort : HANDLE

    /**
     * Handle to the connection.
     */
    hConnection : HANDLE

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_port_condition">RAS_PORT_CONDITION</a> structure.
     */
    dwPortCondition : RAS_PORT_CONDITION

    /**
     * Specifies the cumulative number of calls this port has serviced.
     */
    dwTotalNumberOfCalls : UInt32

    /**
     * Specifies the duration of the current connection, in seconds.
     */
    dwConnectDuration : UInt32

    /**
     * Specifies the port name.
     */
    wszPortName : WCHAR[17]

    /**
     * Specifies the media name.
     */
    wszMediaName : WCHAR[17]

    /**
     * Specifies the device name.
     */
    wszDeviceName : WCHAR[129]

    /**
     * Specifies the device type.
     */
    wszDeviceType : WCHAR[17]

}

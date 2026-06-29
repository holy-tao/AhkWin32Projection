#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The MPR_SERVER_0 structure is used to retrieve information about a device.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_server_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_SERVER_0 {
    #StructPack 4

    /**
     * A <b>BOOL</b> that specifies whether the Demand Dial Manager (DDM) is running on the device. If <b>TRUE</b>, the DDM is not running on the device. Otherwise, it is <b>FALSE</b>.
     */
    fLanOnlyMode : BOOL

    /**
     * Specifies the elapsed time, in seconds, since the device was started.
     */
    dwUpTime : UInt32

    /**
     * Specifies the number of ports on the device.
     */
    dwTotalPorts : UInt32

    /**
     * Specifies the number of ports currently in use on the device.
     */
    dwPortsInUse : UInt32

}

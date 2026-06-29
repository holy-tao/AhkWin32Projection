#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PMF_FLAGS.ahk" { PMF_FLAGS }
#Import ".\MFCARD_DES.ahk" { MFCARD_DES }

/**
 * The MFCARD_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes resource usage by one of the hardware functions provided by an instance of a multifunction device.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mfcard_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MFCARD_RESOURCE {
    #StructPack 4

    /**
     * A [MFCARD_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-mfcard_des) structure.
     */
    MfCard_Header : MFCARD_DES

}

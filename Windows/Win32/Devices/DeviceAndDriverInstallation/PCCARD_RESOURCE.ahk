#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCD_FLAGS.ahk" { PCD_FLAGS }
#Import ".\PCCARD_DES.ahk" { PCCARD_DES }

/**
 * The PCCARD_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes resource usage by a PC Card instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-pccard_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct PCCARD_RESOURCE {
    #StructPack 4

    /**
     * A [PCCARD_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-pccard_des) structure.
     */
    PcCard_Header : PCCARD_DES

}

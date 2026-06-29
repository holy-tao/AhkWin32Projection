#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BUSNUMBER_DES structure is used for specifying either a resource list or a resource requirements list that describes bus number usage for a device instance.
 * @remarks
 * The BUSNUMBER_DES structure is included as a member of the [BUSNUMBER_RESOURCE](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-busnumber_resource) structure.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-busnumber_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct BUSNUMBER_DES {
    #StructPack 4

    BUSD_Count : UInt32

    /**
     * Must be set to the constant value <b>BusNumberType_Range</b>.
     */
    BUSD_Type : UInt32

    /**
     * <i>Not used.</i>
     */
    BUSD_Flags : UInt32

    BUSD_Alloc_Base : UInt32

    BUSD_Alloc_End : UInt32

}

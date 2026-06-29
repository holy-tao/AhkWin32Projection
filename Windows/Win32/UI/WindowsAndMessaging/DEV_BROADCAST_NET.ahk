#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_NET {
    #StructPack 4

    dbcn_size : UInt32

    dbcn_devicetype : UInt32

    dbcn_reserved : UInt32

    dbcn_resource : UInt32

    dbcn_flags : UInt32

}

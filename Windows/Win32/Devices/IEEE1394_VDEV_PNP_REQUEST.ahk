#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices
 */
export default struct IEEE1394_VDEV_PNP_REQUEST {
    #StructPack 8

    fulFlags : UInt32

    Reserved : UInt32

    InstanceId : Int64

    DeviceId : Int8

}

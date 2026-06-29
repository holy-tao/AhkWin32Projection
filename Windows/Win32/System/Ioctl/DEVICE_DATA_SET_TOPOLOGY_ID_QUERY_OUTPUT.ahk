#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_TOPOLOGY_ID_QUERY_OUTPUT {
    #StructPack 8

    TopologyRangeBytes : Int64

    TopologyId : Int8[16]

}

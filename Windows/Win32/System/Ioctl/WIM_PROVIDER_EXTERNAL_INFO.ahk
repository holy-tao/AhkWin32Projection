#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WIM_PROVIDER_EXTERNAL_INFO {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    DataSourceId : Int64

    ResourceHash : Int8[20]

}

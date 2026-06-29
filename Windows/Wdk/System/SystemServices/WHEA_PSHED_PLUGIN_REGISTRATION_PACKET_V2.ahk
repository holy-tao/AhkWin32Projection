#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PSHED_PLUGIN_REGISTRATION_PACKET_V2 {
    #StructPack 8

    Length : UInt32

    Version : UInt32

    Context : IntPtr

    FunctionalAreaMask : UInt32

    Reserved : UInt32

    Callbacks : IntPtr

    PluginHandle : IntPtr

}

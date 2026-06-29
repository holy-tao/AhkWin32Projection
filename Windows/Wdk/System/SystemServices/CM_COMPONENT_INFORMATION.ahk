#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_COMPONENT_INFORMATION {
    #StructPack 8

    Flags : IntPtr

    Version : UInt32

    Key : UInt32

    AffinityMask : IntPtr

}

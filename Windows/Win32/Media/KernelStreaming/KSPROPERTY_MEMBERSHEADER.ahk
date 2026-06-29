#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_MEMBERSHEADER {
    #StructPack 4

    MembersFlags : UInt32

    MembersSize : UInt32

    MembersCount : UInt32

    Flags : UInt32

}

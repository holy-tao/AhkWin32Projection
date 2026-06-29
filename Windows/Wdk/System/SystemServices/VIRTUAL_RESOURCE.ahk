#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct VIRTUAL_RESOURCE {
    #StructPack 8

    Capability : IntPtr

    Control : IntPtr

    RsvdP : UInt16

    Status : IntPtr

}

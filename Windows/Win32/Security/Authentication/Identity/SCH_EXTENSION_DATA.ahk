#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCH_EXTENSION_DATA {
    #StructPack 8

    ExtensionType : UInt16

    pExtData : IntPtr

    cbExtData : UInt32

}

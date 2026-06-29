#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct CONTACT_AGGREGATION_BLOB {
    #StructPack 8

    dwCount : UInt32

    lpb : IntPtr

}

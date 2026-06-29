#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KEY_SET_INFORMATION_CLASS.ahk" { KEY_SET_INFORMATION_CLASS }

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct REG_SET_INFORMATION_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    KeySetInformationClass : KEY_SET_INFORMATION_CLASS

    KeySetInformation : IntPtr

    KeySetInformationLength : UInt32

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KEY_INFORMATION_CLASS.ahk" { KEY_INFORMATION_CLASS }

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct REG_QUERY_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    KeyInformationClass : KEY_INFORMATION_CLASS

    KeyInformation : IntPtr

    Length : UInt32

    ResultLength : IntPtr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}

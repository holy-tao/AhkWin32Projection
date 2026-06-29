#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\OBJECT_NAME_INFORMATION.ahk" { OBJECT_NAME_INFORMATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_QUERY_KEY_NAME {
    #StructPack 8

    Object : IntPtr

    ObjectNameInfo : OBJECT_NAME_INFORMATION.Ptr

    Length : UInt32

    ReturnLength : IntPtr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}

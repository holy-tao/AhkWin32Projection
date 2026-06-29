#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXT_HANDLE_INFORMATION {
    #StructPack 8

    HandleTableEntry : Int64

    Handle : Int64

    Object : Int64

    ObjectBody : Int64

    GrantedAccess : Int64

    HandleAttributes : UInt32

    PagedOut : BOOLEAN

}

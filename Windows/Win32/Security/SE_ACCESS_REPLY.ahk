#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRIVILEGE_SET.ahk" { PRIVILEGE_SET }
#Import ".\ACCESS_REASONS.ahk" { ACCESS_REASONS }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SE_ACCESS_REPLY {
    #StructPack 8

    Size : UInt32

    ResultListCount : UInt32

    GrantedAccess : IntPtr

    AccessStatus : IntPtr

    AccessReason : ACCESS_REASONS.Ptr

    Privileges : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOB_SET_ARRAY {
    #StructPack 8

    JobHandle : HANDLE

    MemberLevel : UInt32

    Flags : UInt32

}

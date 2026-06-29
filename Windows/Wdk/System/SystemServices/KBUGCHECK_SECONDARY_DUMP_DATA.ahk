#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_SECONDARY_DUMP_DATA {
    #StructPack 8

    InBuffer : IntPtr

    InBufferLength : UInt32

    MaximumAllowed : UInt32

    Guid : Guid

    OutBuffer : IntPtr

    OutBufferLength : UInt32

}

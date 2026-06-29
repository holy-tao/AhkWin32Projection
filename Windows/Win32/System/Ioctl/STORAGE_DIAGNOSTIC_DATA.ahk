#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DIAGNOSTIC_DATA {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    ProviderId : Guid

    BufferSize : UInt32

    Reserved : UInt32

    DiagnosticDataBuffer : Int8[1]

}

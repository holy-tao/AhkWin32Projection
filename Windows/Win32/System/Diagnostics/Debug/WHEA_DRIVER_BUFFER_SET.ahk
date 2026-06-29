#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_DRIVER_BUFFER_SET {
    #StructPack 8

    Version : UInt32

    Data : IntPtr

    DataSize : UInt32

    SectionTypeGuid : Guid.Ptr

    SectionFriendlyName : IntPtr

    Flags : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }

/**
 * Contains the information needed to access a specific data stream in a minidump file.
 * @remarks
 * In this context, a data stream is a block of data within a minidump file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_directory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_DIRECTORY {
    #StructPack 4

    /**
     * The type of data stream. This member can be one of the values in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_stream_type">MINIDUMP_STREAM_TYPE</a> enumeration.
     */
    StreamType : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure that specifies the location of the data stream.
     */
    Location : MINIDUMP_LOCATION_DESCRIPTOR

}

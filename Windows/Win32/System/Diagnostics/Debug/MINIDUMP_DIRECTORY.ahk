#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk

/**
 * Contains the information needed to access a specific data stream in a minidump file.
 * @remarks
 * 
  * In this context, a data stream is a block of data within a minidump file.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_directory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_DIRECTORY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of data stream. This member can be one of the values in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_stream_type">MINIDUMP_STREAM_TYPE</a> enumeration.
     * @type {Integer}
     */
    StreamType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure that specifies the location of the data stream.
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    Location{
        get {
            if(!this.HasProp("__Location"))
                this.__Location := MINIDUMP_LOCATION_DESCRIPTOR(8, this)
            return this.__Location
        }
    }
}

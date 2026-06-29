#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\MediaFoundation\AM_MEDIA_TYPE.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * Describes a stream captured by a tuner.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ns-sbe-dvr_stream_desc
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DVR_STREAM_DESC extends Win32Struct {
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a unique identifier for the stream.
     * @type {Integer}
     */
    StreamId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates whether or not the stream is the default stream.
     * @type {BOOL}
     */
    Default {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Indicates whether or not the stream has been created.
     * @type {BOOL}
     */
    Creation {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the GUID corresponding to the media subtype.
     * @type {Guid}
     */
    guidSubMediaType {
        get {
            if(!this.HasProp("__guidSubMediaType"))
                this.__guidSubMediaType := Guid(20, this)
            return this.__guidSubMediaType
        }
    }

    /**
     * Specifies the GUID corresponding to the major media type of the stream.
     * @type {Guid}
     */
    guidFormatType {
        get {
            if(!this.HasProp("__guidFormatType"))
                this.__guidFormatType := Guid(36, this)
            return this.__guidFormatType
        }
    }

    /**
     * Defines the major media type of the stream.
     * @type {AM_MEDIA_TYPE}
     */
    MediaType {
        get {
            if(!this.HasProp("__MediaType"))
                this.__MediaType := AM_MEDIA_TYPE(56, this)
            return this.__MediaType
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSSTREAM_UVC_METADATATYPE_TIMESTAMP.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSSTREAM_UVC_METADATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSSTREAM_UVC_METADATATYPE_TIMESTAMP}
     */
    StartOfFrameTimestamp{
        get {
            if(!this.HasProp("__StartOfFrameTimestamp"))
                this.__StartOfFrameTimestamp := KSSTREAM_UVC_METADATATYPE_TIMESTAMP(this.ptr + 0)
            return this.__StartOfFrameTimestamp
        }
    }

    /**
     * @type {KSSTREAM_UVC_METADATATYPE_TIMESTAMP}
     */
    EndOfFrameTimestamp{
        get {
            if(!this.HasProp("__EndOfFrameTimestamp"))
                this.__EndOfFrameTimestamp := KSSTREAM_UVC_METADATATYPE_TIMESTAMP(this.ptr + 16)
            return this.__EndOfFrameTimestamp
        }
    }
}

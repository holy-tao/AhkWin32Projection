#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes a stream captured by a tuner.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ns-sbe-dvr_stream_desc
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DVR_STREAM_DESC {
    #StructPack 8

    Version : UInt32

    /**
     * Specifies a unique identifier for the stream.
     */
    StreamId : UInt32

    /**
     * Indicates whether or not the stream is the default stream.
     */
    Default : BOOL

    /**
     * Indicates whether or not the stream has been created.
     */
    Creation : BOOL

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * Specifies the GUID corresponding to the media subtype.
     */
    guidSubMediaType : Guid

    /**
     * Specifies the GUID corresponding to the major media type of the stream.
     */
    guidFormatType : Guid

    /**
     * Defines the major media type of the stream.
     */
    MediaType : AM_MEDIA_TYPE

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ATSC_FILTER_OPTIONS.ahk" { ATSC_FILTER_OPTIONS }
#Import ".\DSMCC_FILTER_OPTIONS.ahk" { DSMCC_FILTER_OPTIONS }
#Import ".\MPEG2_FILTER.ahk" { MPEG2_FILTER }
#Import ".\MPEG_BCS_DEMUX.ahk" { MPEG_BCS_DEMUX }
#Import ".\MPEG_CONTEXT.ahk" { MPEG_CONTEXT }
#Import ".\MPEG_CONTEXT_TYPE.ahk" { MPEG_CONTEXT_TYPE }
#Import ".\MPEG_REQUEST_TYPE.ahk" { MPEG_REQUEST_TYPE }
#Import ".\MPEG_WINSOCK.ahk" { MPEG_WINSOCK }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_SERVICE_REQUEST {
    #StructPack 4

    Type : MPEG_REQUEST_TYPE

    Context : MPEG_CONTEXT

    Pid : UInt16

    TableId : Int8

    Filter : MPEG2_FILTER

    Flags : UInt32

}

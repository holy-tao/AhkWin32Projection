#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG_WINSOCK.ahk" { MPEG_WINSOCK }
#Import ".\MPEG_CONTEXT_TYPE.ahk" { MPEG_CONTEXT_TYPE }
#Import ".\MPEG_BCS_DEMUX.ahk" { MPEG_BCS_DEMUX }

/**
 * The MPEG_CONTEXT structure identifies the source of an MPEG-2 data stream.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_context
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_CONTEXT {
    #StructPack 4


    struct _U {
        Demux : MPEG_BCS_DEMUX

        static __New() {
            DefineProp(this.Prototype, 'Winsock', { type: MPEG_WINSOCK, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Specifies the source type, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_context_type">MPEG_CONTEXT_TYPE</a> value. Currently, the value must be MPEG_CONTEXT_BCS_DEMUX.
     */
    Type : MPEG_CONTEXT_TYPE

    /**
     * A union that contains the following members.
     */
    U : MPEG_CONTEXT._U

}

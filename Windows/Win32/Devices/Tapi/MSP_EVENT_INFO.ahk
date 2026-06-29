#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITStream.ahk" { ITStream }
#Import ".\FT_STATE_EVENT_CAUSE.ahk" { FT_STATE_EVENT_CAUSE }
#Import ".\MSP_CALL_EVENT.ahk" { MSP_CALL_EVENT }
#Import ".\MSP_CALL_EVENT_CAUSE.ahk" { MSP_CALL_EVENT_CAUSE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\MSP_ADDRESS_EVENT.ahk" { MSP_ADDRESS_EVENT }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import ".\ITFileTrack.ahk" { ITFileTrack }
#Import ".\TERMINAL_MEDIA_STATE.ahk" { TERMINAL_MEDIA_STATE }
#Import ".\MSP_EVENT.ahk" { MSP_EVENT }

/**
 * The MSP_EVENT_INFO (msp.h) structure defines the type of event returned by the GetEvent method.
 * @see https://learn.microsoft.com/windows/win32/api/msp/ns-msp-msp_event_info
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct MSP_EVENT_INFO {
    #StructPack 8


    struct _MSP_ADDRESS_EVENT_INFO {
        Type : MSP_ADDRESS_EVENT

        pTerminal : ITTerminal

    }

    struct _MSP_CALL_EVENT_INFO {
        Type : MSP_CALL_EVENT

        Cause : MSP_CALL_EVENT_CAUSE

        pStream : ITStream

        pTerminal : ITTerminal

        hrError : HRESULT

    }

    struct _MSP_TSP_DATA {
        dwBufferSize : UInt32

        pBuffer : Int8[1]

    }

    struct _MSP_PRIVATE_EVENT_INFO {
        pEvent : IDispatch

        lEventCode : Int32

    }

    struct _MSP_FILE_TERMINAL_EVENT_INFO {
        pParentFileTerminal : ITTerminal

        pFileTrack : ITFileTrack

        TerminalMediaState : TERMINAL_MEDIA_STATE

        ftecEventCause : FT_STATE_EVENT_CAUSE

        hrErrorCode : HRESULT

    }

    struct _MSP_ASR_TERMINAL_EVENT_INFO {
        pASRTerminal : ITTerminal

        hrErrorCode : HRESULT

    }

    struct _MSP_TTS_TERMINAL_EVENT_INFO {
        pTTSTerminal : ITTerminal

        hrErrorCode : HRESULT

    }

    struct _MSP_TONE_TERMINAL_EVENT_INFO {
        pToneTerminal : ITTerminal

        hrErrorCode : HRESULT

    }

    /**
     * Total size of structure returned.
     */
    dwSize : UInt32

    Event : MSP_EVENT

    /**
     * MSP handle; may be <b>NULL</b>.
     */
    hCall : IntPtr

    MSP_ADDRESS_EVENT_INFO : MSP_EVENT_INFO._MSP_ADDRESS_EVENT_INFO

    static __New() {
        DefineProp(this.Prototype, 'MSP_CALL_EVENT_INFO', { type: MSP_EVENT_INFO._MSP_CALL_EVENT_INFO, offset: 16 })
        DefineProp(this.Prototype, 'MSP_TSP_DATA', { type: MSP_EVENT_INFO._MSP_TSP_DATA, offset: 16 })
        DefineProp(this.Prototype, 'MSP_PRIVATE_EVENT_INFO', { type: MSP_EVENT_INFO._MSP_PRIVATE_EVENT_INFO, offset: 16 })
        DefineProp(this.Prototype, 'MSP_FILE_TERMINAL_EVENT_INFO', { type: MSP_EVENT_INFO._MSP_FILE_TERMINAL_EVENT_INFO, offset: 16 })
        DefineProp(this.Prototype, 'MSP_ASR_TERMINAL_EVENT_INFO', { type: MSP_EVENT_INFO._MSP_ASR_TERMINAL_EVENT_INFO, offset: 16 })
        DefineProp(this.Prototype, 'MSP_TTS_TERMINAL_EVENT_INFO', { type: MSP_EVENT_INFO._MSP_TTS_TERMINAL_EVENT_INFO, offset: 16 })
        DefineProp(this.Prototype, 'MSP_TONE_TERMINAL_EVENT_INFO', { type: MSP_EVENT_INFO._MSP_TONE_TERMINAL_EVENT_INFO, offset: 16 })
        this.DeleteProp("__New")
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_SEQ\_SET\_PARMS structure contains information for the MCI\_SET command for MIDI sequencer devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-seq-set-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_SEQ_SET_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Sequencer's time format.
     */
    dwTimeFormat : UInt32

    /**
     * Audio output channel.
     */
    dwAudio : UInt32

    /**
     * Tempo.
     */
    dwTempo : UInt32

    /**
     * Port.
     */
    dwPort : UInt32

    /**
     * Type of synchronization used by the sequencer for subordinate operation.
     */
    dwSlave : UInt32

    /**
     * Type of synchronization used by the sequencer for master operation.
     */
    dwMaster : UInt32

    /**
     * Data offset.
     */
    dwOffset : UInt32

}

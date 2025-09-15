#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_SEQ\_SET\_PARMS structure contains information for the MCI\_SET command for MIDI sequencer devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-seq-set-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_SEQ_SET_PARMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Sequencer's time format.
     * @type {Integer}
     */
    dwTimeFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Audio output channel.
     * @type {Integer}
     */
    dwAudio {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Tempo.
     * @type {Integer}
     */
    dwTempo {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Port.
     * @type {Integer}
     */
    dwPort {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type of synchronization used by the sequencer for subordinate operation.
     * @type {Integer}
     */
    dwSlave {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type of synchronization used by the sequencer for master operation.
     * @type {Integer}
     */
    dwMaster {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Data offset.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

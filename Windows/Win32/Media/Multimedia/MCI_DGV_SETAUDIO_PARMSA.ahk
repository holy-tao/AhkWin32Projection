#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The MCI_DGV_SETAUDIO_PARMS structure contains parameters for the MCI_SETAUDIO command for digital-video devices.
 * @remarks
 * 
  * When assigning data to the members of this structure, set the corresponding flags in the <i>fdwCommand</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/dd757160(v=vs.85)">mciSendCommand</a> function to validate the members.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The digitalv.h header defines MCI_DGV_SETAUDIO_PARMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//digitalv/ns-digitalv-mci_dgv_setaudio_parmsa
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class MCI_DGV_SETAUDIO_PARMSA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The low-order word specifies a window handle used for the MCI_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Constant indicating the target adjustment. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/Multimedia/mci-setaudio">MCI_SETAUDIO</a> command.
     * @type {Integer}
     */
    dwItem {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Adjustment level.
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Transmission length.
     * @type {Integer}
     */
    dwOver {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string containing the name of the audio-compression algorithm.
     * @type {PSTR}
     */
    lpstrAlgorithm{
        get {
            if(!this.HasProp("__lpstrAlgorithm"))
                this.__lpstrAlgorithm := PSTR(this.ptr + 24)
            return this.__lpstrAlgorithm
        }
    }

    /**
     * Pointer to a null-terminated string containing a descriptor of the audio-compression algorithm.
     * @type {PSTR}
     */
    lpstrQuality{
        get {
            if(!this.HasProp("__lpstrQuality"))
                this.__lpstrQuality := PSTR(this.ptr + 32)
            return this.__lpstrQuality
        }
    }
}

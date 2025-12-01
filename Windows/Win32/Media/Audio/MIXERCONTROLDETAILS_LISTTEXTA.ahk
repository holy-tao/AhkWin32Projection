#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERCONTROLDETAILS structure refers to control-detail structures, retrieving or setting state information of an audio mixer control. (mixercontroldetails_listtexta)
 * @remarks
 * The following standard control types use this structure for retrieving the item text descriptions on multiple-item controls:
 * 
 * Fader control:
 * 
 * MIXERCONTROL_CONTROLTYPE_EQUALIZER
 * 
 * List controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_MIXER
 * 
 * MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT
 * 
 * MIXERCONTROL_CONTROLTYPE_MUX
 * 
 * MIXERCONTROL_CONTROLTYPE_SINGLESELECT
 * 
 * 
 * 
 * > [!NOTE]
 * > The mmeapi.h header defines MIXERCONTROLDETAILS_LISTTEXT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontroldetails_listtexta
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIXERCONTROLDETAILS_LISTTEXTA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * Control class-specific values. The following control types are listed with their corresponding values:
     * 
     * | Name | Description |
     * |------------|-------------|
     * | EQUALIZER  | MIXERCONTROL. Bounds dwMinimum member.|
     * | MIXER and MUX  | MIXERLINEdwLineID member.|
     * | MULTIPLESELECT and SINGLESELECT | Undefined; must be zero |
     * @type {Integer}
     */
    dwParam1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * See dwParam1.
     * @type {Integer}
     */
    dwParam2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Name describing a single item in a multiple-item control. This text can be used as a label or item text, depending on the control class.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 8, 63, "UTF-8")
        set => StrPut(value, this.ptr + 8, 63, "UTF-8")
    }
}

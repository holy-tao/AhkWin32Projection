#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MIXERCONTROLDETAILS structure refers to control-detail structures, retrieving or setting state information of an audio mixer control. (mixercontroldetails_listtextw)
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
 * > [!NOTE]
 * > The mmeapi.h header defines MIXERCONTROLDETAILS_LISTTEXT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontroldetails_listtextw
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct MIXERCONTROLDETAILS_LISTTEXTW {
    #StructPack 4

    /**
     * Control class-specific values. The following control types are listed with their corresponding values:
     * 
     * | Name | Description |
     * |------------|-------------|
     * | EQUALIZER  | MIXERCONTROL. Bounds dwMinimum member.|
     * | MIXER and MUX  | MIXERLINEdwLineID member.|
     * | MULTIPLESELECT and SINGLESELECT | Undefined; must be zero |
     */
    dwParam1 : UInt32

    /**
     * See dwParam1.
     */
    dwParam2 : UInt32

    /**
     * Name describing a single item in a multiple-item control. This text can be used as a label or item text, depending on the control class.
     */
    szName : WCHAR[64]

}

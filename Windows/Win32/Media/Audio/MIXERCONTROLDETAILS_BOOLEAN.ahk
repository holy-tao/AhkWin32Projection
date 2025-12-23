#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERCONTROLDETAILS_BOOLEAN structure retrieves and sets Boolean control properties for an audio mixer control.
 * @remarks
 * The following standard control types use this structure for retrieving and setting properties.
 * 
 * Meter controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_BOOLEANMETER
 * 
 * 
 *  
 * 
 * Switch controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_BOOLEAN
 * 
 * MIXERCONTROL_CONTROLTYPE_BUTTON
 * 
 * MIXERCONTROL_CONTROLTYPE_LOUDNESS
 * 
 * MIXERCONTROL_CONTROLTYPE_MONO
 * 
 * MIXERCONTROL_CONTROLTYPE_MUTE
 * 
 * MIXERCONTROL_CONTROLTYPE_ONOFF
 * 
 * MIXERCONTROL_CONTROLTYPE_STEREOENH
 * 
 * 
 *  
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
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontroldetails_boolean
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIXERCONTROLDETAILS_BOOLEAN extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Boolean value for a single item or channel. This value is assumed to be zero for a FALSE state (such as off or disabled), and nonzero for a TRUE state (such as on or enabled).
     * @type {Integer}
     */
    fValue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

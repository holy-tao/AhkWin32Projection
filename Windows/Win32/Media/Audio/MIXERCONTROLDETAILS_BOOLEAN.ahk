#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct MIXERCONTROLDETAILS_BOOLEAN {
    #StructPack 4

    /**
     * Boolean value for a single item or channel. This value is assumed to be zero for a FALSE state (such as off or disabled), and nonzero for a TRUE state (such as on or enabled).
     */
    fValue : Int32

}

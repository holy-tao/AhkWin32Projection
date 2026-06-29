#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MIXERCONTROLDETAILS_UNSIGNED structure retrieves and sets unsigned type control properties for an audio mixer control.
 * @remarks
 * The following standard control types use this structure for retrieving and setting properties:
 * 
 * Meter control:
 * 
 * MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER
 * 
 * Number control:
 * 
 * MIXERCONTROL_CONTROLTYPE_UNSIGNED
 * 
 * Fader controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_BASS
 * 
 * MIXERCONTROL_CONTROLTYPE_EQUALIZER
 * 
 * MIXERCONTROL_CONTROLTYPE_FADER
 * 
 * MIXERCONTROL_CONTROLTYPE_TREBLE
 * 
 * MIXERCONTROL_CONTROLTYPE_VOLUME
 * 
 * Time controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_MICROTIME
 * 
 * MIXERCONTROL_CONTROLTYPE_MILLITIME
 * 
 * MIXERCONTROL_CONTROLTYPE_PERCENT
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontroldetails_unsigned
 * @namespace Windows.Win32.Media.Audio
 */
export default struct MIXERCONTROLDETAILS_UNSIGNED {
    #StructPack 4

    /**
     * Unsigned integer value for a single item or channel. This value must be inclusively within the bounds given in the Bounds structure member of the MIXERCONTROL structure for unsigned integer controls.
     */
    dwValue : UInt32

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class MIXERCONTROLDETAILS_UNSIGNED extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Unsigned integer value for a single item or channel. This value must be inclusively within the bounds given in the Bounds structure member of the MIXERCONTROL structure for unsigned integer controls.
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

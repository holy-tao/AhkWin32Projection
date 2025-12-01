#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERCONTROLDETAILS_SIGNED structure retrieves and sets signed type control properties for an audio mixer control.
 * @remarks
 * The following standard control types use this structure for retrieving and setting properties:
 * 
 * Meter controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_PEAKMETER
 * 
 * MIXERCONTROL_CONTROLTYPE_SIGNEDMETER
 * 
 * Member controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_SIGNED
 * 
 * Number controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_DECIBELS
 * 
 * Slider controls:
 * 
 * MIXERCONTROL_CONTROLTYPE_PAN
 * 
 * MIXERCONTROL_CONTROLTYPE_QSOUNDPAN
 * 
 * MIXERCONTROL_CONTROLTYPE_SLIDER
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontroldetails_signed
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIXERCONTROLDETAILS_SIGNED extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Signed integer value for a single item or channel. This value must be inclusively within the bounds given in the Bounds member of this structure for signed integer controls.
     * @type {Integer}
     */
    lValue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

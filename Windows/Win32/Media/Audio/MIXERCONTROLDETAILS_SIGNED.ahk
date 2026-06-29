#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct MIXERCONTROLDETAILS_SIGNED {
    #StructPack 4

    /**
     * Signed integer value for a single item or channel. This value must be inclusively within the bounds given in the Bounds member of this structure for signed integer controls.
     */
    lValue : Int32

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIXERLINECONTROLS structure contains information about the controls of an audio line. (MIXERLINECONTROLSW)
 * @remarks
 * > [!NOTE]
  * > The mmeapi.h header defines MIXERLINECONTROLS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixerlinecontrolsw
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class MIXERLINECONTROLSW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size, in bytes, of the <b>MIXERLINECONTROLS</b> structure. This member must be initialized before calling the <a href="https://docs.microsoft.com/previous-versions/dd757302(v=vs.85)">mixerGetLineControls</a> function. The size specified in this member must be large enough to contain the <b>MIXERLINECONTROLS</b> structure. When <b>mixerGetLineControls</b> returns, this member contains the actual size of the information returned. The returned information will not exceed the requested size, nor will it be smaller than the <b>MIXERLINECONTROLS</b> structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Line identifier for which controls are being queried. This member is not used if the MIXER_GETLINECONTROLSF_ONEBYID flag is specified for the <a href="https://docs.microsoft.com/previous-versions/dd757302(v=vs.85)">mixerGetLineControls</a> function, but the mixer device still returns this member in this case. The <b>dwControlID</b> and <b>dwControlType</b> members are not used when MIXER_GETLINECONTROLSF_ALL is specified.
     * @type {Integer}
     */
    dwLineID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwControlID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwControlType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structure elements to retrieve. This member must be initialized by the application before calling the <a href="https://docs.microsoft.com/previous-versions/dd757302(v=vs.85)">mixerGetLineControls</a> function. This member can be 1 only if MIXER_GETLINECONTROLSF_ONEBYID or MIXER_GETLINECONTROLSF_ONEBYTYPE is specified or the value returned in the <b>cControls</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixerlinea">MIXERLINE</a> structure returned for an audio line. This member cannot be zero. If an audio line specifies that it has no controls, <b>mixerGetLineControls</b> should not be called.
     * @type {Integer}
     */
    cControls {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size, in bytes, of a single <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structure. The size specified in this member must be at least large enough to contain the base <b>MIXERCONTROL</b> structure. The total size, in bytes, required for the buffer pointed to by the <b>pamxctrl</b> member is the product of the <b>cbmxctrl</b> and <b>cControls</b> members of the <b>MIXERLINECONTROLS</b> structure.
     * @type {Integer}
     */
    cbmxctrl {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/mmeapi/ns-mmeapi-mixercontrola">MIXERCONTROL</a> structures to receive the properties of the requested audio line controls. This member cannot be <b>NULL</b> and must be initialized before calling the <a href="https://docs.microsoft.com/previous-versions/dd757302(v=vs.85)">mixerGetLineControls</a> function. Each element of the array of controls must be at least large enough to contain a base <b>MIXERCONTROL</b> structure. The <b>cbmxctrl</b> member must specify the size, in bytes, of each element in this array. No initialization of the buffer pointed to by this member is required by the application. All members are filled in by the mixer device (including the <b>cbStruct</b> member of each <b>MIXERCONTROL</b> structure) upon returning successfully.
     * @type {Pointer<MIXERCONTROLW>}
     */
    pamxctrl {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

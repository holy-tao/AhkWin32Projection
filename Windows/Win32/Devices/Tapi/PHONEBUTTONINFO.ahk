#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PHONEBUTTONINFO structure contains information about a button on a phone device. This structure is used by multiple TAPI and TSPI functions.
 * @remarks
 * 
  * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
  * 
  * Older applications are compiled without this field in the 
  * <b>PHONEBUTTONINFO</b> structure, and using a SIZEOF PHONEBUTTONINFO smaller than the new size. The application passes in a <i>dwAPIVersion</i> parameter with the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneopen">phoneOpen</a> function, which can be used for guidance by TAPI in handling this situation. If the application passes in a <b>dwTotalSize</b> less than the size of the fixed portion of the structure as defined in the specified <b>dwAPIVersion</b>, PHONEERR_STRUCTURETOOSMALL is returned. If sufficient memory has been allocated by the application, before calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_phonegetbuttoninfo">TSPI_phoneGetButtonInfo</a> function, TAPI sets the <b>dwNeededSize</b> and <b>dwUsedSize</b> members to the fixed size of the structure as it existed in the specified API version.
  * 
  * New service providers (which support the new API version) must examine the API version passed in. If the API version is less than the highest version supported by the provider, the service provider must not fill in fields not supported in older API versions, as these would fall in the variable portion of the older structure.
  * 
  * New applications must be cognizant of the API version negotiated, and not examine the contents of fields in the fixed portion beyond the original end of the fixed portion of the structure for the negotiated API version.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-phonebuttoninfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONEBUTTONINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Mode or general usage class of the button. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonmode--constants">PHONEBUTTONMODE_ Constants</a>.
     * @type {Integer}
     */
    dwButtonMode {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Function assigned to the button. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonfunction--constants">PHONEBUTTONFUNCTION_ Constants</a>.
     * @type {Integer}
     */
    dwButtonFunction {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the descriptive text for the button, in bytes.
     * @type {Integer}
     */
    dwButtonTextSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing descriptive text for this button. The format of this information is as specified in the <b>dwStringFormat</b> member of the phone's device capabilities. The size of the field is specified by <b>dwButtonTextSize</b>.
     * @type {Integer}
     */
    dwButtonTextOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size of the device-specific field, in bytes. If the device-specific field is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * For the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetbuttoninfo">phoneGetButtonInfo</a> function, this field indicates the current state of the button, using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonstate--constants">PHONEBUTTONSTATE_ Constants</a>. This field is ignored by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesetbuttoninfo">phoneSetButtonInfo</a> function.
     * @type {Integer}
     */
    dwButtonState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}

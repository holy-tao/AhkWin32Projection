#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FWPM_CLASSIFY_OPTIONS0 structure is used to store FWPM_CLASSIFY_OPTION0 structures.
 * @remarks
 * <b>FWPM_CLASSIFY_OPTIONS0</b> is a specific implementation of FWPM_CLASSIFY_OPTIONS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_options0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CLASSIFY_OPTIONS0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of <b>FWPM_CLASSIFY_OPTION0</b> structures in the <b>options</b> member.
     * @type {Integer}
     */
    numOptions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * [size_is(numCredentials)]
     * 
     * Pointer to an array of [FWPM_CLASSIFY_OPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_option0) structures.
     * @type {Pointer<FWPM_CLASSIFY_OPTION0>}
     */
    options {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

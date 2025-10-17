#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store credential name information.
 * @remarks
 * 
  * <b>IKEEXT_NAME_CREDENTIAL0</b> is a specific implementation of IKEEXT_NAME_CREDENTIAL. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_name_credential0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_NAME_CREDENTIAL0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Name of the principal.
     * @type {PWSTR}
     */
    principalName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

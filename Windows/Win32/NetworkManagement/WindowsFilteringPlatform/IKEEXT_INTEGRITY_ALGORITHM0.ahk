#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the IKE/AuthIP hash algorithm.
 * @remarks
 * 
 * <b>IKEEXT_INTEGRITY_ALGORITHM0</b> is a specific implementation of IKEEXT_INTEGRITY_ALGORITHM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_integrity_algorithm0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_INTEGRITY_ALGORITHM0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The type of hash algorithm.
     * 
     * See [IKEEXT_INTEGRITY_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_integrity_type) for more information.
     * @type {Integer}
     */
    algoIdentifier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

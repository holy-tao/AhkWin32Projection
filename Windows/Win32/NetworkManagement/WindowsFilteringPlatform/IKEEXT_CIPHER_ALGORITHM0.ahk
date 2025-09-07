#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information about the IKE/AuthIP encryption algorithm.
 * @remarks
 * <b>IKEEXT_CIPHER_ALGORITHM0</b> is a specific implementation of IKEEXT_CIPHER_ALGORITHM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cipher_algorithm0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CIPHER_ALGORITHM0 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The type of encryption algorithm.
     * 
     * See [IKEEXT_CIPHER_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cipher_type) for more information.
     * @type {Integer}
     */
    algoIdentifier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Unused parameter, always set it to 0.
     * @type {Integer}
     */
    keyLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unused parameter, always set it to 0.
     * @type {Integer}
     */
    rounds {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store information about an IPsec security association (SA).
 * @remarks
 * 
 * <b>IPSEC_SA0</b> is a specific implementation of IPSEC_SA. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_sa0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Security parameter index (SPI) of the IPsec SA. <b>IPSEC_SA_SPI</b> is defined in ipsectypes.h as UINT32.
     * @type {Integer}
     */
    spi {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Transform type of the SA specifying the IPsec security protocol.
     * 
     * See [IPSEC_TRANSFORM_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_transform_type) for more information.
     * @type {Integer}
     */
    saTransformType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<IPSEC_SA_AUTH_INFORMATION0>}
     */
    ahInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_SA_AUTH_INFORMATION0>}
     */
    espAuthInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_SA_CIPHER_INFORMATION0>}
     */
    espCipherInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0>}
     */
    espAuthAndCipherInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IPSEC_SA_AUTH_INFORMATION0>}
     */
    espAuthFwInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the version of the TPM.
 * @see https://learn.microsoft.com/windows/win32/api/tbs/ns-tbs-tpm_device_info
 * @namespace Windows.Win32.System.TpmBaseServices
 * @version v4.0.30319
 */
class TPM_DEVICE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The version of the TBS context implementation. This parameter must be set to 	TPM_VERSION_20.
     * @type {Integer}
     */
    structVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * TPM version. Will be set to TPM_VERSION_12 or TPM_VERSION_20.
     * @type {Integer}
     */
    tpmVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    tpmInterfaceType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    tpmImpRevision {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

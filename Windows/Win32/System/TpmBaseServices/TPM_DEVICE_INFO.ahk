#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about the version of the TPM.
 * @see https://learn.microsoft.com/windows/win32/api/tbs/ns-tbs-tpm_device_info
 * @namespace Windows.Win32.System.TpmBaseServices
 */
export default struct TPM_DEVICE_INFO {
    #StructPack 4

    /**
     * The version of the TBS context implementation. This parameter must be set to 	TPM_VERSION_20.
     */
    structVersion : UInt32

    /**
     * TPM version. Will be set to TPM_VERSION_12 or TPM_VERSION_20.
     */
    tpmVersion : UInt32

    /**
     * Reserved
     */
    tpmInterfaceType : UInt32

    /**
     * Reserved
     */
    tpmImpRevision : UInt32

}

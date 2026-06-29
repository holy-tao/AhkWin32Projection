#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the identity of the primary module of an enclave.
 * @see https://learn.microsoft.com/windows/win32/api/ntenclv/ns-ntenclv-enclave_identity
 * @namespace Windows.Win32.System.Environment
 */
export default struct ENCLAVE_IDENTITY {
    #StructPack 4

    /**
     * The identifier of the owner for the enclave.
     */
    OwnerId : Int8[32]

    /**
     * The unique identifier of the primary module for the enclave.
     */
    UniqueId : Int8[32]

    /**
     * The author identifier of the primary module for the enclave.
     */
    AuthorId : Int8[32]

    /**
     * The family identifier of the primary module for the enclave.
     */
    FamilyId : Int8[16]

    /**
     * The image identifier of the primary module for the enclave.
     */
    ImageId : Int8[16]

    /**
     * The security version number of the primary module for the enclave.
     */
    EnclaveSvn : UInt32

    /**
     * The security version number of the Virtual Secure Mode (VSM) kernel.
     */
    SecureKernelSvn : UInt32

    /**
     * The security version number of the platform that hosts the enclave.
     */
    PlatformSvn : UInt32

    /**
     * Flags that describe the runtime policy for the enclave.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_FLAG_FULL_DEBUG_ENABLED"></a><a id="enclave_flag_full_debug_enabled"></a><dl>
     * <dt><b>ENCLAVE_FLAG_FULL_DEBUG_ENABLED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enclave supports debugging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED"></a><a id="enclave_flag_dynamic_debug_enabled"></a><dl>
     * <dt><b>ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enclave supports dynamic debugging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE"></a><a id="enclave_flag_dynamic_debug_active"></a><dl>
     * <dt><b>ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dynamic debugging is turned on for the enclave.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * The signing level of the primary module for the enclave.
     */
    SigningLevel : UInt32

    EnclaveType : UInt32

}

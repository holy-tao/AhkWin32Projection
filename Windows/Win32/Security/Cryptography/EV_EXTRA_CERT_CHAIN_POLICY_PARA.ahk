#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ROOT_PROGRAM_FLAGS.ahk" { CERT_ROOT_PROGRAM_FLAGS }

/**
 * Specifies the parameters that are passed in for EV policy validation. Applications use this structure to pass hints to the API that indicate which of the policy qualifier flags of the extended validation certificates are important to the application.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ev_extra_cert_chain_policy_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct EV_EXTRA_CERT_CHAIN_POLICY_PARA {
    #StructPack 4

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    dwRootProgramQualifierFlags : CERT_ROOT_PROGRAM_FLAGS

}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DS_NAME_FLAGS enumeration is used to define how the name syntax will be cracked. These flags are used by the DsCrackNames function.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ne-ntdsapi-ds_name_flags
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_NAME_FLAGS{

    /**
     * Indicates that there are no associated flags.
     * @type {Integer (Int32)}
     */
    static DS_NAME_NO_FLAGS => 0

    /**
     * Performs a syntactical mapping at the client without transferring over the network. The only syntactic mapping supported is from <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_FQDN_1779_NAME</a> to <b>DS_CANONICAL_NAME</b> or <b>DS_CANONICAL_NAME_EX</b>. <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dscracknamesa">DsCrackNames</a> returns the <b>DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING</b> flag if a  syntactical mapping is not possible.
     * @type {Integer (Int32)}
     */
    static DS_NAME_FLAG_SYNTACTICAL_ONLY => 1

    /**
     * Forces a trip to the domain controller for evaluation, even if the syntax could be cracked locally.
     * @type {Integer (Int32)}
     */
    static DS_NAME_FLAG_EVAL_AT_DC => 2

    /**
     * The call fails if the domain controller is not a global catalog server.
     * @type {Integer (Int32)}
     */
    static DS_NAME_FLAG_GCVERIFY => 4

    /**
     * Enables cross forest trust referral.
     * @type {Integer (Int32)}
     */
    static DS_NAME_FLAG_TRUST_REFERRAL => 8
}

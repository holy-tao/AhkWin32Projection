#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DS_NAME_FLAGS enumeration is used to define how the name syntax will be cracked. These flags are used by the DsCrackNames function.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_name_flags
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DS_NAME_FLAGS extends Win32Enum {

    /**
     * Indicates that there are no associated flags.
     * Native name: DS_NAME_NO_FLAGS
     * @type {Integer (Int32)}
     */
    static NO_FLAGS => 0

    /**
     * Performs a syntactical mapping at the client without transferring over the network. The only syntactic mapping supported is from <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_FQDN_1779_NAME</a> to <b>DS_CANONICAL_NAME</b> or <b>DS_CANONICAL_NAME_EX</b>. <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dscracknamesa">DsCrackNames</a> returns the <b>DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING</b> flag if a  syntactical mapping is not possible.
     * Native name: DS_NAME_FLAG_SYNTACTICAL_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_SYNTACTICAL_ONLY => 1

    /**
     * Forces a trip to the domain controller for evaluation, even if the syntax could be cracked locally.
     * Native name: DS_NAME_FLAG_EVAL_AT_DC
     * @type {Integer (Int32)}
     */
    static FLAG_EVAL_AT_DC => 2

    /**
     * The call fails if the domain controller is not a global catalog server.
     * Native name: DS_NAME_FLAG_GCVERIFY
     * @type {Integer (Int32)}
     */
    static FLAG_GCVERIFY => 4

    /**
     * Enables cross forest trust referral.
     * Native name: DS_NAME_FLAG_TRUST_REFERRAL
     * @type {Integer (Int32)}
     */
    static FLAG_TRUST_REFERRAL => 8
}

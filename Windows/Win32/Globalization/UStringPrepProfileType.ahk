#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UStringPrepProfileType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3491_NAMEPREP => 0

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3530_NFS4_CS_PREP => 1

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3530_NFS4_CS_PREP_CI => 2

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3530_NFS4_CIS_PREP => 3

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3530_NFS4_MIXED_PREP_PREFIX => 4

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3530_NFS4_MIXED_PREP_SUFFIX => 5

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3722_ISCSI => 6

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3920_NODEPREP => 7

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC3920_RESOURCEPREP => 8

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC4011_MIB => 9

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC4013_SASLPREP => 10

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC4505_TRACE => 11

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC4518_LDAP => 12

    /**
     * @type {Integer (Int32)}
     */
    static USPREP_RFC4518_LDAP_CI => 13
}

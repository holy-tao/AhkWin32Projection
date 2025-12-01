#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DS_NAME_ERROR enumeration defines the errors returned by the status member of the DS_NAME_RESULT_ITEM structure. These are potential errors that may be encountered while a name is converted by the DsCrackNames function.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_name_error
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_NAME_ERROR extends Win32Enum{

    /**
     * The conversion was successful.
     * @type {Integer (Int32)}
     */
    static DS_NAME_NO_ERROR => 0

    /**
     * A generic processing error occurred.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_RESOLVING => 1

    /**
     * The name cannot be found or the caller does not have permission to access the name.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_NOT_FOUND => 2

    /**
     * The input name is mapped to more than one output name or the desired format did not have a single, unique value for the object found.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_NOT_UNIQUE => 3

    /**
     * The input name was found, but the associated output format cannot be found. This can occur if the object does not have all the required attributes.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_NO_MAPPING => 4

    /**
     * Unable to resolve entire name, but was able to determine in which domain object resides. The caller is expected to retry the call at a domain controller for the specified domain. The entire name cannot be resolved, but the domain that the object resides in could be determined. The <b>pDomain</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_result_itema">DS_NAME_RESULT_ITEM</a> contains valid data when this error is specified.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_DOMAIN_ONLY => 5

    /**
     * A syntactical mapping cannot be performed on the client without transmitting over the network.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING => 6

    /**
     * The name is from an external trusted forest.
     * @type {Integer (Int32)}
     */
    static DS_NAME_ERROR_TRUST_REFERRAL => 7
}

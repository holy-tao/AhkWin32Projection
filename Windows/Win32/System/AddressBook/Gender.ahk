#Requires AutoHotkey v2.0.0 64-bit

/**
 * Do not use. The Gender enumeration specifies the possible values for the PR_GENDER property.
 * @see https://docs.microsoft.com/windows/win32/api//wabtags/ne-wabtags-gender
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class Gender{

    /**
     * No gender is specified.
     * @type {Integer (Int32)}
     */
    static genderUnspecified => 0

    /**
     * Specifies a gender of female.
     * @type {Integer (Int32)}
     */
    static genderFemale => 1

    /**
     * Specifies a gender of male.
     * @type {Integer (Int32)}
     */
    static genderMale => 2
}

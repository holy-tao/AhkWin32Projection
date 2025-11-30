#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that indicate the type of data pointed to by the ptstrName member of the TRUSTEE structure.
 * @see https://docs.microsoft.com/windows/win32/api//accctrl/ne-accctrl-trustee_form
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class TRUSTEE_FORM extends Win32Enum{

    /**
     * The <b>ptstrName</b> member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that identifies the trustee.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_SID => 0

    /**
     * The <b>ptstrName</b> member is a pointer to a null-terminated string that identifies the trustee.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_NAME => 1

    /**
     * Indicates a trustee form that is not valid.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_BAD_FORM => 2

    /**
     * The <b>ptstrName</b> member is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_sid">OBJECTS_AND_SID</a> structure that contains the SID of the trustee and the GUIDs of the object types in an object-specific <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a> (ACE).
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_OBJECTS_AND_SID => 3

    /**
     * The <b>ptstrName</b> member is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-objects_and_name_a">OBJECTS_AND_NAME</a> structure that contains the name of the trustee and the names of the object types in an object-specific ACE.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_OBJECTS_AND_NAME => 4
}

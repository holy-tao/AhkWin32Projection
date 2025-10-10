#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_ACEFLAG_ENUM enumeration is used to specify the behavior of an Access Control Entry (ACE) for an Active Directory object.
 * @remarks
 * 
  * Because VBScript cannot read data from a type library, VBScript applications do not understand the symbolic constants as defined in these enumerations. You should use the numerical constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in your VBScript applications.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_aceflag_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_ACEFLAG_ENUM{

    /**
     * Child objects will inherit this access-control entry (ACE). The inherited ACE is inheritable unless the ADS_ACEFLAG_NO_PROPAGATE_INHERIT_ACE flag is set.
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_INHERIT_ACE => 2

    /**
     * The system will clear the ADS_ACEFLAG_INHERIT_ACE flag for the inherited ACEs of child objects. This prevents the ACE from being inherited by subsequent generations of objects.
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_NO_PROPAGATE_INHERIT_ACE => 4

    /**
     * Indicates that an inherit-only ACE that does not exercise access control on the object to which it is attached. If this flag is not set, the ACE is an effective ACE that exerts access control on the object to which it is attached.
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_INHERIT_ONLY_ACE => 8

    /**
     * Indicates whether or not the ACE was inherited. The system sets this bit.
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_INHERITED_ACE => 16

    /**
     * Indicates whether the inherit flags are valid. The system sets this bit.
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_VALID_INHERIT_FLAGS => 31

    /**
     * Generates audit messages for successful access attempts, used with ACEs that audit the system in a system access-control list (SACL).
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_SUCCESSFUL_ACCESS => 64

    /**
     * Generates audit messages for failed access attempts, used with ACEs that audit the system in a SACL.
     * @type {Integer (Int32)}
     */
    static ADS_ACEFLAG_FAILED_ACCESS => 128
}

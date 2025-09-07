#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_SYSTEMFLAG_ENUM enumeration defines some of the values that can be assigned to the systemFlags attribute. Some of the values in the enumeration are specific to attributeSchema objects; other values can be set on objects of any class.
 * @remarks
 * For <b>classSchema</b> and <b>attributeSchema</b> objects, the 0x10 bit of the <b>systemFlags</b> attribute indicates an object that is part of the base schema included with Active Directory. This bit cannot be set on new <b>classSchema</b> and <b>attributeSchema</b> objects. The <b>ADS_SYSTEMFLAG_ENUM</b> enumeration does not include a constant for this bit.
  * 
  * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. Use the numeric constants instead to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, you should make explicit declarations of such constants, as done here, in your VBScript applications.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_systemflag_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SYSTEMFLAG_ENUM{

    /**
     * Identifies an object that cannot be deleted.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_DISALLOW_DELETE => -2147483648

    /**
     * For objects in the configuration partition, if this flag is set, the object can be renamed; otherwise, the object cannot be renamed. By default, this flag is not set on new objects created under the configuration partition, and you can set this flag only during object creation.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_CONFIG_ALLOW_RENAME => 1073741824

    /**
     * For objects in the configuration partition, if this flag is set, the object can be moved; otherwise, the object cannot be moved. By default, this flag is not set on new objects created under the configuration partition, and you can set this flag only during object creation.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_CONFIG_ALLOW_MOVE => 536870912

    /**
     * For objects in the configuration partition, if this flag is set, the object can be moved with restrictions; otherwise, the object cannot be moved. By default, this flag is not set on new objects created under the configuration partition, and you can set this flag only during object creation.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_CONFIG_ALLOW_LIMITED_MOVE => 268435456

    /**
     * Identifies a domain object that cannot be renamed.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_DOMAIN_DISALLOW_RENAME => 134217728

    /**
     * Identifies a domain object that cannot be moved.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_DOMAIN_DISALLOW_MOVE => 67108864

    /**
     * Naming context is in NTDS.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_CR_NTDS_NC => 1

    /**
     * Naming context is a domain.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_CR_NTDS_DOMAIN => 2

    /**
     * If this flag is set in the <b>systemFlags</b> attribute of an <b>attributeSchema</b> object, the attribute is not to be replicated.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_ATTR_NOT_REPLICATED => 1

    /**
     * If this flag is set in the <b>systemFlags</b> attribute of an <b>attributeSchema</b> object, the attribute is a constructed property.
     * @type {Integer (Int32)}
     */
    static ADS_SYSTEMFLAG_ATTR_IS_CONSTRUCTED => 4
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the relative description type for a property description, as determined by the relativeDescriptionType attribute of the displayInfo element.
 * @remarks
 * 
  * These values are defined in propsys.h and propsys.idl.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-propdesc_relativedescription_type
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_RELATIVEDESCRIPTION_TYPE{

    /**
     * General type.
     * @type {Integer (Int32)}
     */
    static PDRDT_GENERAL => 0

    /**
     * Date type.
     * @type {Integer (Int32)}
     */
    static PDRDT_DATE => 1

    /**
     * Size type.
     * @type {Integer (Int32)}
     */
    static PDRDT_SIZE => 2

    /**
     * Count type.
     * @type {Integer (Int32)}
     */
    static PDRDT_COUNT => 3

    /**
     * Revision type.
     * @type {Integer (Int32)}
     */
    static PDRDT_REVISION => 4

    /**
     * Length type.
     * @type {Integer (Int32)}
     */
    static PDRDT_LENGTH => 5

    /**
     * Duration type.
     * @type {Integer (Int32)}
     */
    static PDRDT_DURATION => 6

    /**
     * Speed type.
     * @type {Integer (Int32)}
     */
    static PDRDT_SPEED => 7

    /**
     * Rate type.
     * @type {Integer (Int32)}
     */
    static PDRDT_RATE => 8

    /**
     * Rating type.
     * @type {Integer (Int32)}
     */
    static PDRDT_RATING => 9

    /**
     * Priority type.
     * @type {Integer (Int32)}
     */
    static PDRDT_PRIORITY => 10
}

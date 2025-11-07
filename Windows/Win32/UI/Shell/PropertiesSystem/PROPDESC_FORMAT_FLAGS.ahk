#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by property description helper functions, such as PSFormatForDisplay, to indicate the format of a property string.
 * @remarks
 * 
 * These values are defined in propsys.h and propsys.idl.
 * 
 * Typically use one, or a bitwise combination of these flags to specify format. Some flags are mutually exclusive, for example PDFF_SHORTTIME  | PDFF_LONGTIME | PDFF_HIDETIME, is not allowed.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-propdesc_format_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_FORMAT_FLAGS{

    /**
     * Use the format settings specified in the property's .propdesc file.
     * @type {Integer (Int32)}
     */
    static PDFF_DEFAULT => 0

    /**
     * Precede the value with the property's display name. If the <i>hideLabelPrefix</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-labelinfo">labelInfo</a> element in the property's .propinfo file is set to <b>true</b>, then this flag is ignored.
     * @type {Integer (Int32)}
     */
    static PDFF_PREFIXNAME => 1

    /**
     * Treat the string as a file name.
     * @type {Integer (Int32)}
     */
    static PDFF_FILENAME => 2

    /**
     * Byte sizes are always displayed in KB, regardless of size. This enables clean alignment of the values in the column. This flag applies only to properties that have been declared as type <b>Integer</b> in the <i>displayType</i> attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-displayinfo">displayInfo</a> element in the property's .propinfo file. This flag overrides the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-numberformat">numberFormat</a> setting.
     * @type {Integer (Int32)}
     */
    static PDFF_ALWAYSKB => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PDFF_RESERVED_RIGHTTOLEFT => 8

    /**
     * Display time as "hh:mm am/pm".
     * @type {Integer (Int32)}
     */
    static PDFF_SHORTTIME => 16

    /**
     * Display time as "hh:mm:ss am/pm".
     * @type {Integer (Int32)}
     */
    static PDFF_LONGTIME => 32

    /**
     * Hide the time portion of <c>datetime</c>.
     * @type {Integer (Int32)}
     */
    static PDFF_HIDETIME => 64

    /**
     * Display date as "MM/DD/YY". For example, "03/21/04".
     * @type {Integer (Int32)}
     */
    static PDFF_SHORTDATE => 128

    /**
     * Display date as "DayOfWeek, Month day, year". For example, "Monday, March 21, 2009".
     * @type {Integer (Int32)}
     */
    static PDFF_LONGDATE => 256

    /**
     * Hide the date portion of <c>datetime</c>.
     * @type {Integer (Int32)}
     */
    static PDFF_HIDEDATE => 512

    /**
     * Use friendly date descriptions. For example, "Yesterday".
     * @type {Integer (Int32)}
     */
    static PDFF_RELATIVEDATE => 1024

    /**
     * Return the invitation text if formatting failed or the value was empty. Invitation text is text displayed in a text box as a cue for the user, such as "Enter your name". Formatting can fail if the data entered is not of an expected type, such as when alpha characters have been entered in a phone-number field.
     * @type {Integer (Int32)}
     */
    static PDFF_USEEDITINVITATION => 2048

    /**
     * If this flag is used, the <b>PDFF_USEEDITINVITATION</b> flag must also be specified. When the formatting flags are <b>PDFF_READONLY</b> | <b>PDFF_USEEDITINVITATION</b> and the algorithm would have shown invitation text, a string is returned that indicates the value is "Unknown" instead of returning the invitation text.
     * @type {Integer (Int32)}
     */
    static PDFF_READONLY => 4096

    /**
     * Do not detect reading order automatically. Useful when converting to ANSI to omit the Unicode reading order characters. However, reading order characters for some values are still returned.
     * @type {Integer (Int32)}
     */
    static PDFF_NOAUTOREADINGORDER => 8192
}

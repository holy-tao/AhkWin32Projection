#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a file's perceived type. This set of constants is used in the AssocGetPerceivedType function.
 * @remarks
 * 
 * Prior to Windows Vista, this enumeration was declared in Shlwapi.h.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shtypes/ne-shtypes-perceived
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class PERCEIVED{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_FIRST => -3

    /**
     * The file's perceived type as defined in the registry is not a known type.
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_CUSTOM => -3

    /**
     * The file does not have a perceived type.
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_UNSPECIFIED => -2

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_FOLDER => -1

    /**
     * The file's perceived type hasn't yet been requested. This is the cached type of the object when it is created. This value is never returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-assocgetperceivedtype">AssocGetPerceivedType</a>.
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_UNKNOWN => 0

    /**
     * The file's perceived type is "text".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_TEXT => 1

    /**
     * The file's perceived type is "image".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_IMAGE => 2

    /**
     * The file's perceived type is "audio".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_AUDIO => 3

    /**
     * The file's perceived type is "video".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_VIDEO => 4

    /**
     * The file's perceived type is "compressed".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_COMPRESSED => 5

    /**
     * The file's perceived type is "document".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_DOCUMENT => 6

    /**
     * The file's perceived type is "system".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_SYSTEM => 7

    /**
     * The file's perceived type is "application".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_APPLICATION => 8

    /**
     * <b>Windows Vista and later</b>. The file's perceived type is "gamemedia".
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_GAMEMEDIA => 9

    /**
     * <b>Windows Vista and later</b>.The file's perceived type is "contacts"
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_CONTACTS => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PERCEIVED_TYPE_LAST => 10
}

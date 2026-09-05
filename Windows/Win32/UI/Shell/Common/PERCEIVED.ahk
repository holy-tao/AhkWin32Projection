#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies a file's perceived type. This set of constants is used in the AssocGetPerceivedType function.
 * @remarks
 * Prior to Windows Vista, this enumeration was declared in Shlwapi.h.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-perceived
 * @namespace Windows.Win32.UI.Shell.Common
 */
class PERCEIVED extends Win32Enum {

    /**
     * Native name: PERCEIVED_TYPE_FIRST
     * @type {Integer (Int32)}
     */
    static TYPE_FIRST => -3

    /**
     * The file's perceived type as defined in the registry is not a known type.
     * Native name: PERCEIVED_TYPE_CUSTOM
     * @type {Integer (Int32)}
     */
    static TYPE_CUSTOM => -3

    /**
     * The file does not have a perceived type.
     * Native name: PERCEIVED_TYPE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static TYPE_UNSPECIFIED => -2

    /**
     * Not used.
     * Native name: PERCEIVED_TYPE_FOLDER
     * @type {Integer (Int32)}
     */
    static TYPE_FOLDER => -1

    /**
     * The file's perceived type hasn't yet been requested. This is the cached type of the object when it is created. This value is never returned by <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-assocgetperceivedtype">AssocGetPerceivedType</a>.
     * Native name: PERCEIVED_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static TYPE_UNKNOWN => 0

    /**
     * The file's perceived type is "text".
     * Native name: PERCEIVED_TYPE_TEXT
     * @type {Integer (Int32)}
     */
    static TYPE_TEXT => 1

    /**
     * The file's perceived type is "image".
     * Native name: PERCEIVED_TYPE_IMAGE
     * @type {Integer (Int32)}
     */
    static TYPE_IMAGE => 2

    /**
     * The file's perceived type is "audio".
     * Native name: PERCEIVED_TYPE_AUDIO
     * @type {Integer (Int32)}
     */
    static TYPE_AUDIO => 3

    /**
     * The file's perceived type is "video".
     * Native name: PERCEIVED_TYPE_VIDEO
     * @type {Integer (Int32)}
     */
    static TYPE_VIDEO => 4

    /**
     * The file's perceived type is "compressed".
     * Native name: PERCEIVED_TYPE_COMPRESSED
     * @type {Integer (Int32)}
     */
    static TYPE_COMPRESSED => 5

    /**
     * The file's perceived type is "document".
     * Native name: PERCEIVED_TYPE_DOCUMENT
     * @type {Integer (Int32)}
     */
    static TYPE_DOCUMENT => 6

    /**
     * The file's perceived type is "system".
     * Native name: PERCEIVED_TYPE_SYSTEM
     * @type {Integer (Int32)}
     */
    static TYPE_SYSTEM => 7

    /**
     * The file's perceived type is "application".
     * Native name: PERCEIVED_TYPE_APPLICATION
     * @type {Integer (Int32)}
     */
    static TYPE_APPLICATION => 8

    /**
     * <b>Windows Vista and later</b>. The file's perceived type is "gamemedia".
     * Native name: PERCEIVED_TYPE_GAMEMEDIA
     * @type {Integer (Int32)}
     */
    static TYPE_GAMEMEDIA => 9

    /**
     * <b>Windows Vista and later</b>.The file's perceived type is "contacts"
     * Native name: PERCEIVED_TYPE_CONTACTS
     * @type {Integer (Int32)}
     */
    static TYPE_CONTACTS => 10

    /**
     * Native name: PERCEIVED_TYPE_LAST
     * @type {Integer (Int32)}
     */
    static TYPE_LAST => 10
}

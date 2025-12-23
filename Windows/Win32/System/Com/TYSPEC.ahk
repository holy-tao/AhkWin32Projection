#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a mapping for a class ID.
 * @remarks
 * The TYSPEC enumeration and uCLSSPEC union provide mappings to a class ID. Note that TYSPEC_CLSID is the only supported value.
 * 
 * 
 * ``` syntax
 *     typedef union switch(DWORD tyspec)
 *         {
 *         case TYSPEC_CLSID:
 *             CLSID   clsid;
 *         case TYSPEC_FILEEXT:
 *             LPOLESTR pFileExt;
 *         case TYSPEC_MIMETYPE:
 *             LPOLESTR pMimeType;
 *         case TYSPEC_PROGID:
 *             LPOLESTR pProgId;
 *         case TYSPEC_FILENAME:
 *             LPOLESTR pFileName;
 *         case TYSPEC_PACKAGENAME:
 *             struct {
 *             LPOLESTR pPackageName;
 *             GUID     PolicyId;
 *             } ByName;
 *         case TYSPEC_OBJECTID:
 *             struct {
 *             GUID     ObjectId;
 *             GUID     PolicyId;
 *             } ByObjectId;
 *     } uCLSSPEC;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-tyspec
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class TYSPEC extends Win32Enum{

    /**
     * A CLSID.
     * @type {Integer (Int32)}
     */
    static TYSPEC_CLSID => 0

    /**
     * A file name extension.
     * @type {Integer (Int32)}
     */
    static TYSPEC_FILEEXT => 1

    /**
     * A MIME type.
     * @type {Integer (Int32)}
     */
    static TYSPEC_MIMETYPE => 2

    /**
     * A file name.
     * @type {Integer (Int32)}
     */
    static TYSPEC_FILENAME => 3

    /**
     * A PROGID.
     * @type {Integer (Int32)}
     */
    static TYSPEC_PROGID => 4

    /**
     * A package name.
     * @type {Integer (Int32)}
     */
    static TYSPEC_PACKAGENAME => 5

    /**
     * An object ID.
     * @type {Integer (Int32)}
     */
    static TYSPEC_OBJECTID => 6
}

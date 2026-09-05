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
 */
class TYSPEC extends Win32Enum {

    /**
     * A CLSID.
     * Native name: TYSPEC_CLSID
     * @type {Integer (Int32)}
     */
    static CLSID => 0

    /**
     * A file name extension.
     * Native name: TYSPEC_FILEEXT
     * @type {Integer (Int32)}
     */
    static FILEEXT => 1

    /**
     * A MIME type.
     * Native name: TYSPEC_MIMETYPE
     * @type {Integer (Int32)}
     */
    static MIMETYPE => 2

    /**
     * A file name.
     * Native name: TYSPEC_FILENAME
     * @type {Integer (Int32)}
     */
    static FILENAME => 3

    /**
     * A PROGID.
     * Native name: TYSPEC_PROGID
     * @type {Integer (Int32)}
     */
    static PROGID => 4

    /**
     * A package name.
     * Native name: TYSPEC_PACKAGENAME
     * @type {Integer (Int32)}
     */
    static PACKAGENAME => 5

    /**
     * An object ID.
     * Native name: TYSPEC_OBJECTID
     * @type {Integer (Int32)}
     */
    static OBJECTID => 6
}

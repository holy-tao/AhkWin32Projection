#Requires AutoHotkey v2.0.0 64-bit

/**
 * The Status enumeration indicates the result of a Windows GDI+ method call.
 * @remarks
 * 
 * If you construct a GDI+ object and then immediately call the 
 * 				<b>GetLastStatus</b> method of that object, you can determine whether the constructor succeeded or failed. In such cases, 
 * 				<b>GetLastStatus</b> might return <b><b>OutOfMemory</b></b> even though there was plenty of memory available to create the object. Several GDI+ constructors set the status to <b><b>OutOfMemory</b></b> when they fail regardless of the reason for failure.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/ne-gdiplustypes-status
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Status{

    /**
     * Indicates that the method call was successful.
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * Indicates that there was an error on the method call, which is identified as something other than those defined by the other elements of this enumeration.
     * @type {Integer (Int32)}
     */
    static GenericError => 1

    /**
     * Indicates that one of the arguments passed to the method was not valid.
     * @type {Integer (Int32)}
     */
    static InvalidParameter => 2

    /**
     * Indicates that the operating system is out of memory and could not allocate memory to process the method call. For an explanation of how constructors use the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplustypes/ne-gdiplustypes-status">OutOfMemory</a> status, see the Remarks section at the end of this topic.
     * @type {Integer (Int32)}
     */
    static OutOfMemory => 3

    /**
     * Indicates that one of the arguments specified in the API call is already in use in another thread.
     * @type {Integer (Int32)}
     */
    static ObjectBusy => 4

    /**
     * Indicates that a buffer specified as an argument in the API call is not large enough to hold the data to be received.
     * @type {Integer (Int32)}
     */
    static InsufficientBuffer => 5

    /**
     * Indicates that the method is not implemented.
     * @type {Integer (Int32)}
     */
    static NotImplemented => 6

    /**
     * Indicates that the method generated a Win32 error.
     * @type {Integer (Int32)}
     */
    static Win32Error => 7

    /**
     * Indicates that the object is in an invalid state to satisfy the API call. For example, calling 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdipluspen/nf-gdipluspen-pen-getcolor">Pen::GetColor</a> from a pen that is not a single, solid color results in a <a href="https://docs.microsoft.com/windows/desktop/api/gdiplustypes/ne-gdiplustypes-status">WrongState</a> status.
     * @type {Integer (Int32)}
     */
    static WrongState => 8

    /**
     * Indicates that the method was aborted.
     * @type {Integer (Int32)}
     */
    static Aborted => 9

    /**
     * Indicates that the specified image file or metafile cannot be found.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 10

    /**
     * Indicates that the method performed an arithmetic operation that produced a numeric overflow.
     * @type {Integer (Int32)}
     */
    static ValueOverflow => 11

    /**
     * Indicates that a write operation is not allowed on the specified file.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 12

    /**
     * Indicates that the specified image file format is not known.
     * @type {Integer (Int32)}
     */
    static UnknownImageFormat => 13

    /**
     * Indicates that the specified font family cannot be found. Either the font family name is incorrect or the font family is not installed.
     * @type {Integer (Int32)}
     */
    static FontFamilyNotFound => 14

    /**
     * Indicates that the specified style is not available for the specified font family.
     * @type {Integer (Int32)}
     */
    static FontStyleNotFound => 15

    /**
     * Indicates that the font retrieved from an 
 * 				<b>HDC</b> or 
 * 				<b>LOGFONT</b> is not a TrueType font and cannot be used with GDI+.
     * @type {Integer (Int32)}
     */
    static NotTrueTypeFont => 16

    /**
     * Indicates that the version of GDI+ that is installed on the system is incompatible with the version with which the application was compiled.
     * @type {Integer (Int32)}
     */
    static UnsupportedGdiplusVersion => 17

    /**
     * Indicates that the GDI+API is not in an initialized state. To function, all GDI+ objects require that GDI+ be in an initialized state. Initialize GDI+ by calling 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/nf-gdiplusinit-gdiplusstartup">GdiplusStartup</a>.
     * @type {Integer (Int32)}
     */
    static GdiplusNotInitialized => 18

    /**
     * Indicates that the specified property does not exist in the image.
     * @type {Integer (Int32)}
     */
    static PropertyNotFound => 19

    /**
     * Indicates that the specified property is not supported by the format of the image and, therefore, cannot be set.
     * @type {Integer (Int32)}
     */
    static PropertyNotSupported => 20

    /**
     * Indicates that the color profile required to save an image in CMYK format was not found.
     * @type {Integer (Int32)}
     */
    static ProfileNotFound => 21
}

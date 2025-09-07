#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the format of ink that is stored on the Clipboard.
 * @remarks
 * In C++, explicit casting is required when trying to set more than one flag at a time. A compilation error occurs if explicit casting is not used.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkclipboardformats
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkClipboardFormats{

    /**
     * A flag that can be used to verify whether any formats are present by checking against it.
     * @type {Integer (Int32)}
     */
    static ICF_None => 0

    /**
     * Ink is encoded in ink serialized format (ISF). This is the most compact persistent representation of ink. Although it often contains only ink data, ISF is extensible. Applications can set custom attributes (identified by a globally unique identifier (GUID)) on an <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object, stroke, or point. This allows an application to store any kind of data or metadata that it requires as an attribute in an ISF stream.
     * @type {Integer (Int32)}
     */
    static ICF_InkSerializedFormat => 1

    /**
     * Ink is not expected to form words, but rather is interpreted as a picture. This is also useful for representing multiple words.
     * @type {Integer (Int32)}
     */
    static ICF_SketchInk => 2

    /**
     * Ink is expected to form words. It enables the recognizer to convert the ink to text. The recognized text is either the recognition alternate with the greatest confidence rating or another alternate chosen from a list. This is useful for representing a single word.
     * @type {Integer (Int32)}
     */
    static ICF_TextInk => 6

    /**
     * The enhanced metafile to play to create the background. The metafile must remain valid for as long as it is used to render the ink background.
     * @type {Integer (Int32)}
     */
    static ICF_EnhancedMetafile => 8

    /**
     * Ink is stored as a metafile or a list of commands that can be played back to draw a graphic.
     * @type {Integer (Int32)}
     */
    static ICF_Metafile => 32

    /**
     * The bitmap to use as the background. The bitmap device context must remain valid for as long as it is used to render the ink background.
     * @type {Integer (Int32)}
     */
    static ICF_Bitmap => 64

    /**
     * The formats that can be used for pasting, including <a href="https://docs.microsoft.com/windows/desktop/tablet/sink-and-tink-objects">tInk</a>, sInk, and ISF.
     * @type {Integer (Int32)}
     */
    static ICF_PasteMask => 7

    /**
     * The formats that are copied to the Clipboard through ink.
 * 
 * This is the default value.
     * @type {Integer (Int32)}
     */
    static ICF_CopyMask => 127

    /**
     * Ink is stored as a CopyMask.
     * @type {Integer (Int32)}
     */
    static ICF_Default => 127
}

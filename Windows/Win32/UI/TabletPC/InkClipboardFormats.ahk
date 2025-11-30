#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkclipboardformats
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkClipboardFormats extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ICF_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICF_InkSerializedFormat => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICF_SketchInk => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICF_TextInk => 6

    /**
     * @type {Integer (Int32)}
     */
    static ICF_EnhancedMetafile => 8

    /**
     * @type {Integer (Int32)}
     */
    static ICF_Metafile => 32

    /**
     * @type {Integer (Int32)}
     */
    static ICF_Bitmap => 64

    /**
     * @type {Integer (Int32)}
     */
    static ICF_PasteMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static ICF_CopyMask => 127

    /**
     * @type {Integer (Int32)}
     */
    static ICF_Default => 127
}

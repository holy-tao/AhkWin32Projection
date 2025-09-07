#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible language extensions in a specified subpicture stream.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_subpicture_lang_ext
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_SUBPICTURE_LANG_EXT{

    /**
     * Indicates that no language extensions are present.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_NotSpecified => 0

    /**
     * Indicates that the specified stream contains normal captions.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_Caption_Normal => 1

    /**
     * Indicates that the specified stream contains big captions.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_Caption_Big => 2

    /**
     * Indicates that the specified stream contains captions for children.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_Caption_Children => 3

    /**
     * Indicates that the specified stream contains normal closed captions.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_CC_Normal => 5

    /**
     * Indicates that the specified stream contains big closed captions.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_CC_Big => 6

    /**
     * Indicates that the specified stream contains closed captions for children.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_CC_Children => 7

    /**
     * Indicates that the subpicture stream is forcedly activated, meaning that the application will not be able to turn it off.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_Forced => 9

    /**
     * Indicates that the specified stream contains normal-sized director's comments.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_DirectorComments_Normal => 13

    /**
     * Indicates that the specified stream contains large-sized director's comments.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_DirectorComments_Big => 14

    /**
     * Indicates that the specified stream contains director's comments for children.
     * @type {Integer (Int32)}
     */
    static DVD_SP_EXT_DirectorComments_Children => 15
}

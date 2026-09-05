#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible language extensions in a specified subpicture stream.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_subpicture_lang_ext
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_SUBPICTURE_LANG_EXT extends Win32Enum {

    /**
     * Indicates that no language extensions are present.
     * Native name: DVD_SP_EXT_NotSpecified
     * @type {Integer (Int32)}
     */
    static SP_EXT_NotSpecified => 0

    /**
     * Indicates that the specified stream contains normal captions.
     * Native name: DVD_SP_EXT_Caption_Normal
     * @type {Integer (Int32)}
     */
    static SP_EXT_Caption_Normal => 1

    /**
     * Indicates that the specified stream contains big captions.
     * Native name: DVD_SP_EXT_Caption_Big
     * @type {Integer (Int32)}
     */
    static SP_EXT_Caption_Big => 2

    /**
     * Indicates that the specified stream contains captions for children.
     * Native name: DVD_SP_EXT_Caption_Children
     * @type {Integer (Int32)}
     */
    static SP_EXT_Caption_Children => 3

    /**
     * Indicates that the specified stream contains normal closed captions.
     * Native name: DVD_SP_EXT_CC_Normal
     * @type {Integer (Int32)}
     */
    static SP_EXT_CC_Normal => 5

    /**
     * Indicates that the specified stream contains big closed captions.
     * Native name: DVD_SP_EXT_CC_Big
     * @type {Integer (Int32)}
     */
    static SP_EXT_CC_Big => 6

    /**
     * Indicates that the specified stream contains closed captions for children.
     * Native name: DVD_SP_EXT_CC_Children
     * @type {Integer (Int32)}
     */
    static SP_EXT_CC_Children => 7

    /**
     * Indicates that the subpicture stream is forcedly activated, meaning that the application will not be able to turn it off.
     * Native name: DVD_SP_EXT_Forced
     * @type {Integer (Int32)}
     */
    static SP_EXT_Forced => 9

    /**
     * Indicates that the specified stream contains normal-sized director's comments.
     * Native name: DVD_SP_EXT_DirectorComments_Normal
     * @type {Integer (Int32)}
     */
    static SP_EXT_DirectorComments_Normal => 13

    /**
     * Indicates that the specified stream contains large-sized director's comments.
     * Native name: DVD_SP_EXT_DirectorComments_Big
     * @type {Integer (Int32)}
     */
    static SP_EXT_DirectorComments_Big => 14

    /**
     * Indicates that the specified stream contains director's comments for children.
     * Native name: DVD_SP_EXT_DirectorComments_Children
     * @type {Integer (Int32)}
     */
    static SP_EXT_DirectorComments_Children => 15
}

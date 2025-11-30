#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The DVDSPExt enumeration type holds a value indicating the default DVD subpicture language extension.
 * @see https://docs.microsoft.com/windows/win32/api//segment/ne-segment-dvdspext
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DVDSPExt extends Win32Enum{

    /**
     * Extension not specified.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_NotSpecified => 0

    /**
     * Normal caption size.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_Caption_Normal => 1

    /**
     * Big captions.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_Caption_Big => 2

    /**
     * Children's captions.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_Caption_Children => 3

    /**
     * Normal-sized closed captions.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_CC_Normal => 5

    /**
     * Big closed captions.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_CC_Big => 6

    /**
     * Children's closed captions.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_CC_Children => 7

    /**
     * Forced.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_Forced => 9

    /**
     * Normal-sized director's comments.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_DirectorComments_Normal => 13

    /**
     * Big director's comments.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_DirectorComments_Big => 14

    /**
     * Director's comments for children.
     * @type {Integer (Int32)}
     */
    static dvdSPExt_DirectorComments_Children => 15
}

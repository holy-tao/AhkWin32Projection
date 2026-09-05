#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The TOC_POS_TYPE enumeration contains members that specify the position type of a table of contents.
 * @remarks
 * Currently, only <b>TOC_POS_TOPLEVELOBJECT</b> is supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-toc_pos_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class TOC_POS_TYPE extends Win32Enum {

    /**
     * Specifies that the table of contents is stored in the header of the media file.
     * Native name: TOC_POS_INHEADER
     * @type {Integer (Int32)}
     */
    static INHEADER => 0

    /**
     * Specifies that the table of contents is stored in the body of the media file as a top level object.
     * Native name: TOC_POS_TOPLEVELOBJECT
     * @type {Integer (Int32)}
     */
    static TOPLEVELOBJECT => 1
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TOC_POS_TYPE enumeration contains members that specify the position type of a table of contents.
 * @remarks
 * 
  * Currently, only <b>TOC_POS_TOPLEVELOBJECT</b> is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/ne-wmcodecdsp-toc_pos_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class TOC_POS_TYPE{

    /**
     * Specifies that the table of contents is stored in the header of the media file.
     * @type {Integer (Int32)}
     */
    static TOC_POS_INHEADER => 0

    /**
     * Specifies that the table of contents is stored in the body of the media file as a top level object.
     * @type {Integer (Int32)}
     */
    static TOC_POS_TOPLEVELOBJECT => 1
}

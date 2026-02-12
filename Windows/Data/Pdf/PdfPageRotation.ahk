#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the number of degrees that a page in a Portable Document Format (PDF) document is rotated in the rendered output.
 * @remarks
 * Degrees are expressed relative to a clockwise rotation.
 * @see https://learn.microsoft.com/uwp/api/windows.data.pdf.pdfpagerotation
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class PdfPageRotation extends Win32Enum{

    /**
     * No rotation.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * A 90-degree rotation.
     * @type {Integer (Int32)}
     */
    static Rotate90 => 1

    /**
     * A 180-degree rotation.
     * @type {Integer (Int32)}
     */
    static Rotate180 => 2

    /**
     * A 270-degree rotation.
     * @type {Integer (Int32)}
     */
    static Rotate270 => 3
}

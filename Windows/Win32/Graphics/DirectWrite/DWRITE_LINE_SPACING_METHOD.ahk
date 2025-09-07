#Requires AutoHotkey v2.0.0 64-bit

/**
 * The method used for line spacing in a text layout.
 * @remarks
 * The line spacing method is set by using the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setlinespacing">SetLineSpacing</a> method of the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextformat">IDWriteTextFormat</a> or <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetextlayout">IDWriteTextLayout</a> interfaces.  To get  the current line spacing method of a text format or text layout use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-getlinespacing">GetLineSpacing</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_line_spacing_method
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_LINE_SPACING_METHOD{

    /**
     * Line spacing depends solely on the content, adjusting to accommodate the size of fonts and inline objects.
     * @type {Integer (Int32)}
     */
    static DWRITE_LINE_SPACING_METHOD_DEFAULT => 0

    /**
     * Lines are explicitly set to uniform spacing, regardless of the size of fonts and inline objects. This can be useful to avoid the uneven appearance that can occur from font fallback.
     * @type {Integer (Int32)}
     */
    static DWRITE_LINE_SPACING_METHOD_UNIFORM => 1

    /**
     * Line spacing and baseline distances are proportional to the computed values based on the content, the size of the fonts and inline objects.
 *           
 * 
 * <div class="alert"><b>Note</b>  This value is only available on Windows 10 or later and it can be used with <a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritetextlayout3-setlinespacing">IDWriteTextLayout3::SetLineSpacing</a>, 
 *           but can not be used with <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextformat-setlinespacing">IDWriteTextFormat::SetLineSpacing</a>.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static DWRITE_LINE_SPACING_METHOD_PROPORTIONAL => 2
}

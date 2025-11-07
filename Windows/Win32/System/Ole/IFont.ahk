#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Graphics\Gdi\HFONT.ahk
#Include .\IFont.ahk
#Include ..\..\Graphics\Gdi\TEXTMETRICW.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a wrapper around a Windows font object.
 * @remarks
 * 
 * Each property in the <b>IFont</b> interface includes a 
 *      <b>get_<i>PropertyName</i></b> method if the property supports read 
 *      access and a <b>put_<i>PropertyName</i></b> method if the property 
 *      supports write access. Most of these properties support both read and write access.
 * 
 * <table>
 * <tr>
 * <th>Property</th>
 * <th>Type</th>
 * <th>Read Access Method</th>
 * <th>Write Access Method</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><b>Name</b></td>
 * <td><b>BSTR</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_name">get_Name</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_name">put_Name</a>
 * </td>
 * <td>The facename of the font, e.g. Arial.</td>
 * </tr>
 * <tr>
 * <td><b>Size</b></td>
 * <td><b>CY</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_size">get_Size</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_size">put_Size</a>
 * </td>
 * <td>The point size of the font, expressed in a <b>CY</b> type to allow for fractional 
 *        point sizes.</td>
 * </tr>
 * <tr>
 * <td><b>Bold</b></td>
 * <td><b>BOOL</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_bold">get_Bold</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_bold">put_Bold</a>
 * </td>
 * <td>Indicates whether the font is boldfaced.</td>
 * </tr>
 * <tr>
 * <td><b>Italic</b></td>
 * <td><b>BOOL</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_italic">get_Italic</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_italic">put_Italic</a>
 * </td>
 * <td>Indicates whether the font is italicized.</td>
 * </tr>
 * <tr>
 * <td><b>Underline</b></td>
 * <td><b>BOOL</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_underline">get_Underline</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_underline">put_Underline</a>
 * </td>
 * <td>Indicates whether the font is underlined.</td>
 * </tr>
 * <tr>
 * <td><b>Strikethrough</b></td>
 * <td><b>BOOL</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_strikethrough">get_Strikethrough</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_strikethrough">put_Strikethrough</a>
 * </td>
 * <td>Indicates whether the font is strikethrough.</td>
 * </tr>
 * <tr>
 * <td><b>Weight</b></td>
 * <td><b>short</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_weight">get_Weight</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_weight">put_Weight</a>
 * </td>
 * <td>The boldness of the font.</td>
 * </tr>
 * <tr>
 * <td><b>Charset</b></td>
 * <td><b>short</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_charset">get_Charset</a>
 * </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-put_charset">put_Charset</a>
 * </td>
 * <td>The character set used in the font, such as <b>ANSI_CHARSET</b>, 
 *        <b>DEFAULT_CHARSET</b>, or <b>SYMBOL_CHARSET</b>.</td>
 * </tr>
 * <tr>
 * <td><b>hFont</b></td>
 * <td><b>HFONT</b></td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_hfont">get_hFont</a>
 * </td>
 * <td></td>
 * <td>The Windows font handle that can be selected into a device context for rendering.</td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="OLE_Implementation"></a><a id="ole_implementation"></a><a id="OLE_IMPLEMENTATION"></a>OLE Implementation</h3>
 * The system provides a standard implementation of a font object with the 
 *       <b>IFont</b> interface on top of the underlying system font support. A 
 *       font object is created through the function 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatefontindirect">OleCreateFontIndirect</a>. A font object supports a 
 *       number of read/write properties as well as a set of methods through its 
 *       <b>IFont</b> interface and supports the same set of properties (but not 
 *       the methods) through a dispatch interface <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifontdisp">IFontDisp</a> which is 
 *       derived from <b>IDispatch</b> to provide access to the font's properties through 
 *       Automation. The system implementation of the font object supplies both interfaces.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ifont
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IFont extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFont
     * @type {Guid}
     */
    static IID => Guid("{bef6e002-a874-101a-8bba-00aa00300cab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Size", "put_Size", "get_Bold", "put_Bold", "get_Italic", "put_Italic", "get_Underline", "put_Underline", "get_Strikethrough", "put_Strikethrough", "get_Weight", "put_Weight", "get_Charset", "put_Charset", "get_hFont", "Clone", "IsEqual", "SetRatio", "QueryTextMetrics", "AddRefHfont", "ReleaseHfont", "SetHdc"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(3, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CY} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_size
     */
    get_Size() {
        pSize := CY()
        result := ComCall(5, this, "ptr", pSize, "HRESULT")
        return pSize
    }

    /**
     * 
     * @param {CY} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_size
     */
    put_Size(size) {
        result := ComCall(6, this, "ptr", size, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_bold
     */
    get_Bold() {
        result := ComCall(7, this, "int*", &pBold := 0, "HRESULT")
        return pBold
    }

    /**
     * 
     * @param {BOOL} bold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_bold
     */
    put_Bold(bold) {
        result := ComCall(8, this, "int", bold, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_italic
     */
    get_Italic() {
        result := ComCall(9, this, "int*", &pItalic := 0, "HRESULT")
        return pItalic
    }

    /**
     * 
     * @param {BOOL} italic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_italic
     */
    put_Italic(italic) {
        result := ComCall(10, this, "int", italic, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_underline
     */
    get_Underline() {
        result := ComCall(11, this, "int*", &pUnderline := 0, "HRESULT")
        return pUnderline
    }

    /**
     * 
     * @param {BOOL} underline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_underline
     */
    put_Underline(underline) {
        result := ComCall(12, this, "int", underline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_strikethrough
     */
    get_Strikethrough() {
        result := ComCall(13, this, "int*", &pStrikethrough := 0, "HRESULT")
        return pStrikethrough
    }

    /**
     * 
     * @param {BOOL} strikethrough 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_strikethrough
     */
    put_Strikethrough(strikethrough) {
        result := ComCall(14, this, "int", strikethrough, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_weight
     */
    get_Weight() {
        result := ComCall(15, this, "short*", &pWeight := 0, "HRESULT")
        return pWeight
    }

    /**
     * 
     * @param {Integer} weight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_weight
     */
    put_Weight(weight) {
        result := ComCall(16, this, "short", weight, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_charset
     */
    get_Charset() {
        result := ComCall(17, this, "short*", &pCharset := 0, "HRESULT")
        return pCharset
    }

    /**
     * 
     * @param {Integer} charset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_charset
     */
    put_Charset(charset) {
        result := ComCall(18, this, "short", charset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HFONT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_hfont
     */
    get_hFont() {
        phFont := HFONT()
        result := ComCall(19, this, "ptr", phFont, "HRESULT")
        return phFont
    }

    /**
     * 
     * @returns {IFont} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-clone
     */
    Clone() {
        result := ComCall(20, this, "ptr*", &ppFont := 0, "HRESULT")
        return IFont(ppFont)
    }

    /**
     * 
     * @param {IFont} pFontOther 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-isequal
     */
    IsEqual(pFontOther) {
        result := ComCall(21, this, "ptr", pFontOther, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cyLogical 
     * @param {Integer} cyHimetric 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-setratio
     */
    SetRatio(cyLogical, cyHimetric) {
        result := ComCall(22, this, "int", cyLogical, "int", cyHimetric, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {TEXTMETRICW} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-querytextmetrics
     */
    QueryTextMetrics() {
        pTM := TEXTMETRICW()
        result := ComCall(23, this, "ptr", pTM, "HRESULT")
        return pTM
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-addrefhfont
     */
    AddRefHfont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(24, this, "ptr", hFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-releasehfont
     */
    ReleaseHfont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(25, this, "ptr", hFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hDC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-sethdc
     */
    SetHdc(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(26, this, "ptr", hDC, "HRESULT")
        return result
    }
}

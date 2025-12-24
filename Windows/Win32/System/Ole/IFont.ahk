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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {CY} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * @type {BOOL} 
     */
    Bold {
        get => this.get_Bold()
        set => this.put_Bold(value)
    }

    /**
     * @type {BOOL} 
     */
    Italic {
        get => this.get_Italic()
        set => this.put_Italic(value)
    }

    /**
     * @type {BOOL} 
     */
    Underline {
        get => this.get_Underline()
        set => this.put_Underline(value)
    }

    /**
     * @type {BOOL} 
     */
    Strikethrough {
        get => this.get_Strikethrough()
        set => this.put_Strikethrough(value)
    }

    /**
     * @type {Integer} 
     */
    Weight {
        get => this.get_Weight()
        set => this.put_Weight(value)
    }

    /**
     * @type {Integer} 
     */
    Charset {
        get => this.get_Charset()
        set => this.put_Charset(value)
    }

    /**
     * @type {HFONT} 
     */
    hFont {
        get => this.get_hFont()
    }

    /**
     * Retrieves the name of the font family.
     * @returns {BSTR} A pointer to the caller-allocated variable that receives the name. This string must be freed with <b>SysFreeString</b> when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(3, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * Specifies a new name for the font family.
     * @param {BSTR} name The new name of the font family. This value is both allocated and freed by 
     *       the caller.
     * @returns {HRESULT} The method supports the standard return value <b>E_UNEXPECTED</b>, as well as the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in the <i>name</i> parameter is not valid. For example, it may be 
     *         <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves the point size of the font.
     * @returns {CY} A pointer to the caller-allocated variable that receives the size,  in <b>HIMETRIC</b> 
     *    units.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_size
     */
    get_Size() {
        pSize := CY()
        result := ComCall(5, this, "ptr", pSize, "HRESULT")
        return pSize
    }

    /**
     * Sets the point size of the font.
     * @param {CY} size The new size of the font, in <b>HIMETRIC</b> units.
     * @returns {HRESULT} The method supports the standard return value <b>E_UNEXPECTED</b>, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font was resized successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <i>size</i> parameter is not valid. For example, it does not contain a usable font size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_size
     */
    put_Size(size) {
        result := ComCall(6, this, "ptr", size, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Bold property.
     * @returns {BOOL} A pointer to a caller-allocated 
     *      variable that receives the current Bold property for the font.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_bold
     */
    get_Bold() {
        result := ComCall(7, this, "int*", &pBold := 0, "HRESULT")
        return pBold
    }

    /**
     * Sets the font's Bold property.
     * @param {BOOL} bold The new Bold property for the font.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bold state was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font does not support a bold state. Note that this is not an error condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_bold
     */
    put_Bold(bold) {
        result := ComCall(8, this, "int", bold, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Italic property.
     * @returns {BOOL} A pointer to the caller-allocated variable that receives the current Italic property for the font.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_italic
     */
    get_Italic() {
        result := ComCall(9, this, "int*", &pItalic := 0, "HRESULT")
        return pItalic
    }

    /**
     * Sets the font's Italic property.
     * @param {BOOL} italic The new Italic property for the font.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The italic state was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font does not support an italic state. This value is not an error condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_italic
     */
    put_Italic(italic) {
        result := ComCall(10, this, "int", italic, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Underline property.
     * @returns {BOOL} A pointer to the caller-allocated variable that receives the current Underline property for the font.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_underline
     */
    get_Underline() {
        result := ComCall(11, this, "int*", &pUnderline := 0, "HRESULT")
        return pUnderline
    }

    /**
     * Sets the font's Underline property.
     * @param {BOOL} underline The new Underline property for the font.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underline state was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font does not support an underline state. This value is not an error condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_underline
     */
    put_Underline(underline) {
        result := ComCall(12, this, "int", underline, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Strikethrough property.
     * @returns {BOOL} A pointer to the caller-allocated variable that receives the current Strikethrough property for the font.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_strikethrough
     */
    get_Strikethrough() {
        result := ComCall(13, this, "int*", &pStrikethrough := 0, "HRESULT")
        return pStrikethrough
    }

    /**
     * Sets the font's Strikethrough property.
     * @param {BOOL} strikethrough The new Strikethrough property for the font.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Strikethrough property was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font does not support a strikethrough state. This value is not an error condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_strikethrough
     */
    put_Strikethrough(strikethrough) {
        result := ComCall(14, this, "int", strikethrough, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Weight property.
     * @returns {Integer} A pointer to the caller-allocated variable that receives the current Weight property for the font. For a list of possible values, see the <b>lfWeight</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_weight
     */
    get_Weight() {
        result := ComCall(15, this, "short*", &pWeight := 0, "HRESULT")
        return pWeight
    }

    /**
     * Sets the font's Weight property.
     * @param {Integer} weight The new Weight for the font. For a list of available font weights, see the description of the <b>lfWeight</b> member of 
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Weight property was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This font does not support different weights. This value is not an error condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_weight
     */
    put_Weight(weight) {
        result := ComCall(16, this, "short", weight, "HRESULT")
        return result
    }

    /**
     * Retrieves the character set used in the font.
     * @returns {Integer} A pointer to the caller-allocated variable that receives the character set 
     *       value.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_charset
     */
    get_Charset() {
        result := ComCall(17, this, "short*", &pCharset := 0, "HRESULT")
        return pCharset
    }

    /**
     * Sets the font's character set.
     * @param {Integer} charset The new character set for the font.
     * @returns {HRESULT} The method supports the standard return value <b>E_INVALIDARG</b> and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-put_charset
     */
    put_Charset(charset) {
        result := ComCall(18, this, "short", charset, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the font described by this font object.
     * @returns {HFONT} A pointer to the caller-allocated variable that receives the font handle. 
     *       The caller does not own this resource and must not attempt to destroy the font.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-get_hfont
     */
    get_hFont() {
        phFont := HFONT()
        result := ComCall(19, this, "ptr", phFont, "HRESULT")
        return phFont
    }

    /**
     * Creates a duplicate font object.
     * @returns {IFont} Address of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifont">IFont</a> pointer variable that receives the interface 
     *        pointer to the new font object. The caller must call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IFont::Release</a> when this new font object is no longer 
     *        needed.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-clone
     */
    Clone() {
        result := ComCall(20, this, "ptr*", &ppFont := 0, "HRESULT")
        return IFont(ppFont)
    }

    /**
     * Compares this font object to another for equivalence.
     * @param {IFont} pFontOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifont">IFont</a> interface on the font object to be compared to this font. The reference count of the object referred to by this pointer is not affected by the comparison operation.
     * @returns {HRESULT} The method supports the standard return value <b>E_UNEXPECTED</b>, as well as the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two fonts are equivalent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two fonts are not equivalent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in the <i>pFontOther</i> parameter is not valid. For example, it may be 
     *         <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-isequal
     */
    IsEqual(pFontOther) {
        result := ComCall(21, this, "ptr", pFontOther, "HRESULT")
        return result
    }

    /**
     * Converts the scaling factor for this font between logical units and HIMETRIC units.
     * @param {Integer} cyLogical The font size, in logical units.
     * @param {Integer} cyHimetric The font size, in <b>HIMETRIC</b> units.
     * @returns {HRESULT} The method supports the standard return values E_UNEXPECTED, E_INVALIDARG, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-setratio
     */
    SetRatio(cyLogical, cyHimetric) {
        result := ComCall(22, this, "int", cyLogical, "int", cyHimetric, "HRESULT")
        return result
    }

    /**
     * Fills a caller-allocated structure with information about the font.
     * @returns {TEXTMETRICW} Pointer to the caller-allocated structure that receives the font information. The 
     *    <b>TEXTMETRICOLE</b> structure is defined as a 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRICW</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-querytextmetrics
     */
    QueryTextMetrics() {
        pTM := TEXTMETRICW()
        result := ComCall(23, this, "ptr", pTM, "HRESULT")
        return pTM
    }

    /**
     * Notifies the font object that the previously realized font identified with hFont should remain valid until ReleaseHfont is called or the font object itself is released completely.
     * @param {HFONT} hFont Font handle previously realized through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_hfont">get_hFont</a> to be locked in the font object's cache.
     * @returns {HRESULT} The method supports the standard return values <b>E_UNEXPECTED</b> and <b>E_INVALIDARG</b>, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font was successfully locked in the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-addrefhfont
     */
    AddRefHfont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(24, this, "ptr", hFont, "HRESULT")
        return result
    }

    /**
     * Notifies the font object that the caller that previously locked this font in the cache with IFont::AddRefHfont no longer requires the lock.
     * @param {HFONT} hFont A font handle previously realized through 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_hfont">IFont::get_hFont</a>. This value was passed to a previous 
     *       call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-addrefhfont">IFont::AddRefHfont</a> to lock the font, and the 
     *       caller would now like to unlock the font in the cache.
     * @returns {HRESULT} The method supports the standard return values <b>E_UNEXPECTED</b> and 
     *       <b>E_INVALIDARG</b>, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font was unlocked successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font was not locked in the cache. This return value is a benign notification to the caller that it 
     *         may have a font reference counting problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-releasehfont
     */
    ReleaseHfont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(25, this, "ptr", hFont, "HRESULT")
        return result
    }

    /**
     * Provides a device context to the font that describes the logical mapping mode.
     * @param {HDC} hDC A handle to the device context in which to select the font.
     * @returns {HRESULT} The method supports the standard return value <b>E_INVALIDARG</b>, as well as the 
     *       following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font was selected successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The font selection is not supported through this font object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ifont-sethdc
     */
    SetHdc(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(26, this, "ptr", hDC, "HRESULT")
        return result
    }
}

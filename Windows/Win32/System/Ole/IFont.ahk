#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\CY.ahk" { CY }
#Import "..\..\Graphics\Gdi\TEXTMETRICW.ahk" { TEXTMETRICW }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Graphics\Gdi\HFONT.ahk" { HFONT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a wrapper around a Windows font object.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ifont
 * @namespace Windows.Win32.System.Ole
 */
export default struct IFont extends IUnknown {
    /**
     * The interface identifier for IFont
     * @type {Guid}
     */
    static IID := Guid("{bef6e002-a874-101a-8bba-00aa00300cab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFont interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name          : IntPtr
        put_Name          : IntPtr
        get_Size          : IntPtr
        put_Size          : IntPtr
        get_Bold          : IntPtr
        put_Bold          : IntPtr
        get_Italic        : IntPtr
        put_Italic        : IntPtr
        get_Underline     : IntPtr
        put_Underline     : IntPtr
        get_Strikethrough : IntPtr
        put_Strikethrough : IntPtr
        get_Weight        : IntPtr
        put_Weight        : IntPtr
        get_Charset       : IntPtr
        put_Charset       : IntPtr
        get_hFont         : IntPtr
        Clone             : IntPtr
        IsEqual           : IntPtr
        SetRatio          : IntPtr
        QueryTextMetrics  : IntPtr
        AddRefHfont       : IntPtr
        ReleaseHfont      : IntPtr
        SetHdc            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFont.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_name
     */
    get_Name() {
        pName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * Specifies a new name for the font family.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The string value is caller allocated and the caller is responsible for freeing it after this call 
     *     returns.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves the point size of the font.
     * @returns {CY} A pointer to the caller-allocated variable that receives the size,  in <b>HIMETRIC</b> 
     *    units.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_size
     */
    get_Size() {
        pSize := CY()
        result := ComCall(5, this, CY.Ptr, pSize, "HRESULT")
        return pSize
    }

    /**
     * Sets the point size of the font.
     * @param {CY} _size The new size of the font, in <b>HIMETRIC</b> units.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_size
     */
    put_Size(_size) {
        result := ComCall(6, this, CY, _size, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Bold property.
     * @returns {BOOL} A pointer to a caller-allocated 
     *      variable that receives the current Bold property for the font.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_bold
     */
    get_Bold() {
        result := ComCall(7, this, BOOL.Ptr, &pBold := 0, "HRESULT")
        return pBold
    }

    /**
     * Sets the font's Bold property.
     * @remarks
     * Changing the 
     *    Bold property may also change the Weight 
     *    property. Setting the Bold property to <b>TRUE</b> sets the 
     *    Weight property to <b>FW_BOLD</b> (700); setting the 
     *    Bold property to <b>FALSE</b> sets the 
     *    Weight property to <b>FW_NORMAL</b> (400).
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_bold
     */
    put_Bold(bold) {
        result := ComCall(8, this, BOOL, bold, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Italic property.
     * @returns {BOOL} A pointer to the caller-allocated variable that receives the current Italic property for the font.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_italic
     */
    get_Italic() {
        result := ComCall(9, this, BOOL.Ptr, &pItalic := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_italic
     */
    put_Italic(italic) {
        result := ComCall(10, this, BOOL, italic, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Underline property.
     * @returns {BOOL} A pointer to the caller-allocated variable that receives the current Underline property for the font.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_underline
     */
    get_Underline() {
        result := ComCall(11, this, BOOL.Ptr, &pUnderline := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_underline
     */
    put_Underline(underline) {
        result := ComCall(12, this, BOOL, underline, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Strikethrough property.
     * @returns {BOOL} A pointer to the caller-allocated variable that receives the current Strikethrough property for the font.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_strikethrough
     */
    get_Strikethrough() {
        result := ComCall(13, this, BOOL.Ptr, &pStrikethrough := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_strikethrough
     */
    put_Strikethrough(strikethrough) {
        result := ComCall(14, this, BOOL, strikethrough, "HRESULT")
        return result
    }

    /**
     * Gets the font's current Weight property.
     * @returns {Integer} A pointer to the caller-allocated variable that receives the current Weight property for the font. For a list of possible values, see the <b>lfWeight</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_weight
     */
    get_Weight() {
        result := ComCall(15, this, "short*", &pWeight := 0, "HRESULT")
        return pWeight
    }

    /**
     * Sets the font's Weight property.
     * @remarks
     * This property may 
     *    affect the Bold property as well. The Bold 
     *    property is set to <b>TRUE</b> if the Weight property is 
     *    greater than the average of <b>FW_NORMAL</b> (400) and <b>FW_BOLD</b> (700), 
     *    that is 550.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_weight
     */
    put_Weight(weight) {
        result := ComCall(16, this, "short", weight, "HRESULT")
        return result
    }

    /**
     * Retrieves the character set used in the font.
     * @returns {Integer} A pointer to the caller-allocated variable that receives the character set 
     *       value.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_charset
     */
    get_Charset() {
        result := ComCall(17, this, "short*", &pCharset := 0, "HRESULT")
        return pCharset
    }

    /**
     * Sets the font's character set.
     * @param {Integer} charset The new character set for the font.
     * @returns {HRESULT} The method supports the standard return value <b>E_INVALIDARG</b> and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-put_charset
     */
    put_Charset(charset) {
        result := ComCall(18, this, "short", charset, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the font described by this font object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The font object maintains ownership of the <b>HFONT</b> and can destroy it 
     *     at any time without prior notification. If the caller needs to secure this font for a limited period of time, it 
     *     can call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-addrefhfont">IFont::AddRefHfont</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-releasehfont">IFont::ReleaseHfont</a>.
     * @returns {HFONT} A pointer to the caller-allocated variable that receives the font handle. 
     *       The caller does not own this resource and must not attempt to destroy the font.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-get_hfont
     */
    get_hFont() {
        phFont := HFONT.Owned()
        result := ComCall(19, this, HFONT.Ptr, phFont, "HRESULT")
        return phFont
    }

    /**
     * Creates a duplicate font object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The new font object is entirely independent of the first. The caller is responsible for releasing this new 
     *      object when it is no longer needed. This method does not affect the reference count of the font being cloned.
     * @returns {IFont} Address of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifont">IFont</a> pointer variable that receives the interface 
     *        pointer to the new font object. The caller must call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IFont::Release</a> when this new font object is no longer 
     *        needed.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-clone
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-isequal
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-setratio
     */
    SetRatio(cyLogical, cyHimetric) {
        result := ComCall(22, this, "int", cyLogical, "int", cyHimetric, "HRESULT")
        return result
    }

    /**
     * Fills a caller-allocated structure with information about the font.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * <b>E_NOTIMPL</b> is not a valid return value. Font objects must always provide their font 
     *      information through this call unless other errors occur.
     * @returns {TEXTMETRICW} Pointer to the caller-allocated structure that receives the font information. The 
     *    <b>TEXTMETRICOLE</b> structure is defined as a 
     *    <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRICW</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-querytextmetrics
     */
    QueryTextMetrics() {
        pTM := TEXTMETRICW()
        result := ComCall(23, this, TEXTMETRICW.Ptr, pTM, "HRESULT")
        return pTM
    }

    /**
     * Notifies the font object that the previously realized font identified with hFont should remain valid until ReleaseHfont is called or the font object itself is released completely.
     * @param {HFONT} _hFont Font handle previously realized through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_hfont">get_hFont</a> to be locked in the font object's cache.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-addrefhfont
     */
    AddRefHfont(_hFont) {
        result := ComCall(24, this, HFONT, _hFont, "HRESULT")
        return result
    }

    /**
     * Notifies the font object that the caller that previously locked this font in the cache with IFont::AddRefHfont no longer requires the lock.
     * @param {HFONT} _hFont A font handle previously realized through 
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-releasehfont
     */
    ReleaseHfont(_hFont) {
        result := ComCall(25, this, HFONT, _hFont, "HRESULT")
        return result
    }

    /**
     * Provides a device context to the font that describes the logical mapping mode.
     * @remarks
     * The logical mapping mode affects the font's internal computation of its point size so that when the caller 
     *     asks for a font handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ifont-get_hfont">IFont::get_hFont</a>, the 
     *     font is already properly scaled to the device context.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The caller retains ownership of this device context which must remain valid for the lifetime of 
     *      the font object. Thus, the device context passed should be a memory device context (from the function 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatibledc">CreateCompatibleDC</a>) and not a screen device context 
     *      (from <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a>, 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a>, or 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a>) because screen device contexts are a limited system 
     *      resource.
     * @param {HDC} _hDC A handle to the device context in which to select the font.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ifont-sethdc
     */
    SetHdc(_hDC) {
        result := ComCall(26, this, HDC, _hDC, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFont.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.put_Size := CallbackCreate(GetMethod(implObj, "put_Size"), flags, 2)
        this.vtbl.get_Bold := CallbackCreate(GetMethod(implObj, "get_Bold"), flags, 2)
        this.vtbl.put_Bold := CallbackCreate(GetMethod(implObj, "put_Bold"), flags, 2)
        this.vtbl.get_Italic := CallbackCreate(GetMethod(implObj, "get_Italic"), flags, 2)
        this.vtbl.put_Italic := CallbackCreate(GetMethod(implObj, "put_Italic"), flags, 2)
        this.vtbl.get_Underline := CallbackCreate(GetMethod(implObj, "get_Underline"), flags, 2)
        this.vtbl.put_Underline := CallbackCreate(GetMethod(implObj, "put_Underline"), flags, 2)
        this.vtbl.get_Strikethrough := CallbackCreate(GetMethod(implObj, "get_Strikethrough"), flags, 2)
        this.vtbl.put_Strikethrough := CallbackCreate(GetMethod(implObj, "put_Strikethrough"), flags, 2)
        this.vtbl.get_Weight := CallbackCreate(GetMethod(implObj, "get_Weight"), flags, 2)
        this.vtbl.put_Weight := CallbackCreate(GetMethod(implObj, "put_Weight"), flags, 2)
        this.vtbl.get_Charset := CallbackCreate(GetMethod(implObj, "get_Charset"), flags, 2)
        this.vtbl.put_Charset := CallbackCreate(GetMethod(implObj, "put_Charset"), flags, 2)
        this.vtbl.get_hFont := CallbackCreate(GetMethod(implObj, "get_hFont"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.IsEqual := CallbackCreate(GetMethod(implObj, "IsEqual"), flags, 2)
        this.vtbl.SetRatio := CallbackCreate(GetMethod(implObj, "SetRatio"), flags, 3)
        this.vtbl.QueryTextMetrics := CallbackCreate(GetMethod(implObj, "QueryTextMetrics"), flags, 2)
        this.vtbl.AddRefHfont := CallbackCreate(GetMethod(implObj, "AddRefHfont"), flags, 2)
        this.vtbl.ReleaseHfont := CallbackCreate(GetMethod(implObj, "ReleaseHfont"), flags, 2)
        this.vtbl.SetHdc := CallbackCreate(GetMethod(implObj, "SetHdc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.put_Size)
        CallbackFree(this.vtbl.get_Bold)
        CallbackFree(this.vtbl.put_Bold)
        CallbackFree(this.vtbl.get_Italic)
        CallbackFree(this.vtbl.put_Italic)
        CallbackFree(this.vtbl.get_Underline)
        CallbackFree(this.vtbl.put_Underline)
        CallbackFree(this.vtbl.get_Strikethrough)
        CallbackFree(this.vtbl.put_Strikethrough)
        CallbackFree(this.vtbl.get_Weight)
        CallbackFree(this.vtbl.put_Weight)
        CallbackFree(this.vtbl.get_Charset)
        CallbackFree(this.vtbl.put_Charset)
        CallbackFree(this.vtbl.get_hFont)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.IsEqual)
        CallbackFree(this.vtbl.SetRatio)
        CallbackFree(this.vtbl.QueryTextMetrics)
        CallbackFree(this.vtbl.AddRefHfont)
        CallbackFree(this.vtbl.ReleaseHfont)
        CallbackFree(this.vtbl.SetHdc)
    }
}

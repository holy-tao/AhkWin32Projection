#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(3, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CY>} pSize 
     * @returns {HRESULT} 
     */
    get_Size(pSize) {
        result := ComCall(5, this, "ptr", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CY} size 
     * @returns {HRESULT} 
     */
    put_Size(size) {
        result := ComCall(6, this, "ptr", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pBold 
     * @returns {HRESULT} 
     */
    get_Bold(pBold) {
        result := ComCall(7, this, "ptr", pBold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bold 
     * @returns {HRESULT} 
     */
    put_Bold(bold) {
        result := ComCall(8, this, "int", bold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pItalic 
     * @returns {HRESULT} 
     */
    get_Italic(pItalic) {
        result := ComCall(9, this, "ptr", pItalic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} italic 
     * @returns {HRESULT} 
     */
    put_Italic(italic) {
        result := ComCall(10, this, "int", italic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pUnderline 
     * @returns {HRESULT} 
     */
    get_Underline(pUnderline) {
        result := ComCall(11, this, "ptr", pUnderline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} underline 
     * @returns {HRESULT} 
     */
    put_Underline(underline) {
        result := ComCall(12, this, "int", underline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pStrikethrough 
     * @returns {HRESULT} 
     */
    get_Strikethrough(pStrikethrough) {
        result := ComCall(13, this, "ptr", pStrikethrough, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} strikethrough 
     * @returns {HRESULT} 
     */
    put_Strikethrough(strikethrough) {
        result := ComCall(14, this, "int", strikethrough, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pWeight 
     * @returns {HRESULT} 
     */
    get_Weight(pWeight) {
        result := ComCall(15, this, "short*", pWeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} weight 
     * @returns {HRESULT} 
     */
    put_Weight(weight) {
        result := ComCall(16, this, "short", weight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pCharset 
     * @returns {HRESULT} 
     */
    get_Charset(pCharset) {
        result := ComCall(17, this, "short*", pCharset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charset 
     * @returns {HRESULT} 
     */
    put_Charset(charset) {
        result := ComCall(18, this, "short", charset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HFONT>} phFont 
     * @returns {HRESULT} 
     */
    get_hFont(phFont) {
        result := ComCall(19, this, "ptr", phFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFont>} ppFont 
     * @returns {HRESULT} 
     */
    Clone(ppFont) {
        result := ComCall(20, this, "ptr", ppFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFont>} pFontOther 
     * @returns {HRESULT} 
     */
    IsEqual(pFontOther) {
        result := ComCall(21, this, "ptr", pFontOther, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cyLogical 
     * @param {Integer} cyHimetric 
     * @returns {HRESULT} 
     */
    SetRatio(cyLogical, cyHimetric) {
        result := ComCall(22, this, "int", cyLogical, "int", cyHimetric, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TEXTMETRICW>} pTM 
     * @returns {HRESULT} 
     */
    QueryTextMetrics(pTM) {
        result := ComCall(23, this, "ptr", pTM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     */
    AddRefHfont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(24, this, "ptr", hFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HFONT} hFont 
     * @returns {HRESULT} 
     */
    ReleaseHfont(hFont) {
        hFont := hFont is Win32Handle ? NumGet(hFont, "ptr") : hFont

        result := ComCall(25, this, "ptr", hFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hDC 
     * @returns {HRESULT} 
     */
    SetHdc(hDC) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(26, this, "ptr", hDC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

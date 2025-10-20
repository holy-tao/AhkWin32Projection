#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Exposes a font object's properties through Automation. It provides a subset of the IFont methods.
 * @remarks
 * 
  * The following table describes the dispIDs for the various font properties.
  * 
  * <table>
  * <tr>
  * <th>Constant</th>
  * <th>Value</th>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_NAME
  * 
  * </td>
  * <td>0</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_SIZE
  * </td>
  * <td>2</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_BOLD
  * </td>
  * <td>3</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_ITALIC
  * </td>
  * <td>4</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_UNDER
  * </td>
  * <td>5</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_STRIKE
  * </td>
  * <td>6</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_WEIGHT
  * </td>
  * <td>7</td>
  * </tr>
  * <tr>
  * <td>DISPID_FONT_CHARSET
  * </td>
  * <td>8</td>
  * </tr>
  * </table>
  *  
  * 
  * Each property in the <b>IFontDisp</b> interface includes a <b>get_PropertyName</b> method if the property supports read access and a <b>put_PropertyName</b> method if the property supports write access. These properties support both read and write access.
  * 
  * <table>
  * <tr>
  * <th>Property</th>
  * <th>Type</th>
  * <th>Access</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>Name</td>
  * <td><b>BSTR</b></td>
  * <td>RW</td>
  * <td>The facename of the font, e.g. Arial.
  * </td>
  * </tr>
  * <tr>
  * <td>Size</td>
  * <td><b>CY</b></td>
  * <td>RW</td>
  * <td>The point size of the font, expressed in a <b>CY</b> type to allow for fractional point sizes.
  * </td>
  * </tr>
  * <tr>
  * <td>Bold</td>
  * <td><b>BOOL</b></td>
  * <td>RW</td>
  * <td>Indicates whether the font is boldfaced.
  * </td>
  * </tr>
  * <tr>
  * <td>Italic</td>
  * <td><b>BOOL</b></td>
  * <td>RW</td>
  * <td>Indicates whether the font is italicized.
  * </td>
  * </tr>
  * <tr>
  * <td>Underline</td>
  * <td><b>BOOL</b></td>
  * <td>RW</td>
  * <td>Indicates whether the font is underlined.
  * </td>
  * </tr>
  * <tr>
  * <td>Strikethrough</td>
  * <td><b>BOOL</b></td>
  * <td>RW</td>
  * <td>Indicates whether the font is strikethrough.
  * </td>
  * </tr>
  * <tr>
  * <td>Weight</td>
  * <td><b>short</b></td>
  * <td>RW</td>
  * <td>The boldness of the font.
  * </td>
  * </tr>
  * <tr>
  * <td>Charset</td>
  * <td><b>short</b></td>
  * <td>RW</td>
  * <td>The character set used in the font, such as ANSI_CHARSET, DEFAULT_CHARSET, or SYMBOL_CHARSET.
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * <h3><a id="OLE_Implementation"></a><a id="ole_implementation"></a><a id="OLE_IMPLEMENTATION"></a>OLE Implementation</h3>
  * The system provides a standard implementation of a font object with the <b>IFontDisp</b> interface on top of the underlying system font support. A font object is created through the function <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatefontindirect">OleCreateFontIndirect</a>. A font object supports a number of read/write properties as well as a set of methods through its interface <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ifont">IFont</a> and supports the same set of properties (but not the methods) through a dispatch interface <b>IFontDisp</b> which is derived from <b>IDispatch</b> to provide access to the font's properties through Automation. The system implementation of the font object supplies both interfaces.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ifontdisp
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IFontDisp extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontDisp
     * @type {Guid}
     */
    static IID => Guid("{bef6e003-a874-101a-8bba-00aa00300cab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}

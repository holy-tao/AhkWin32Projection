#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyBag.ahk

/**
 * The IMediaPropertyBag interface is exposed by the Media Property Bag object.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediapropertybag
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaPropertyBag extends IPropertyBag{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{6025a880-c0d5-11d0-bd4e-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumProperty"]

    /**
     * The EnumProperty method retrieves a property/value pair.
     * @param {Integer} iProperty Index value of the pair.
     * @param {Pointer<VARIANT>} pvarPropertyName Pointer to a <b>VARIANT</b> that receives the property's name.
     * @param {Pointer<VARIANT>} pvarPropertyValue Pointer to a <b>VARIANT</b> that receives the property's value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediapropertybag-enumproperty
     */
    EnumProperty(iProperty, pvarPropertyName, pvarPropertyValue) {
        result := ComCall(5, this, "uint", iProperty, "ptr", pvarPropertyName, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }
}

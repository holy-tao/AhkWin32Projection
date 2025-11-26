#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaSample.ahk

/**
 * The IMediaSample2 interface sets and retrieves properties on media samples.This interface inherits the IMediaSample interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediasample2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSample2 extends IMediaSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSample2
     * @type {Guid}
     */
    static IID => Guid("{36b73884-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "SetProperties"]

    /**
     * The GetProperties method retrieves the properties of a media sample.
     * @param {Integer} cbProperties Length of property data to retrieve, in bytes.
     * @param {Pointer} pbProperties Pointer to a buffer of size <i>cbProperties</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediasample2-getproperties
     */
    GetProperties(cbProperties, pbProperties) {
        result := ComCall(19, this, "uint", cbProperties, "ptr", pbProperties, "HRESULT")
        return result
    }

    /**
     * The SetProperties method sets the properties of a media sample.
     * @param {Integer} cbProperties Length of property data to set, in bytes.
     * @param {Pointer} pbProperties Pointer to a buffer of size <i>cbProperties</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediasample2-setproperties
     */
    SetProperties(cbProperties, pbProperties) {
        result := ComCall(20, this, "uint", cbProperties, "ptr", pbProperties, "HRESULT")
        return result
    }
}

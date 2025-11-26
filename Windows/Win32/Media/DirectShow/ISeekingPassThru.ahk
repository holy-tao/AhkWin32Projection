#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISeekingPassThru interface creates a helper object that implements seeking for one-input filters.
 * @remarks
 * 
 * To obtain this interface, call <b>CoCreateInstance</b> with CLSID_SeekingPassThru. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/createpospassthru">CreatePosPassThru</a> function in the base class library.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iseekingpassthru
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ISeekingPassThru extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISeekingPassThru
     * @type {Guid}
     */
    static IID => Guid("{36b73883-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init"]

    /**
     * The Init method initializes the seeking helper object.
     * @param {BOOL} bSupportRendering Boolean value that specifies whether the filter is a renderer. Use the value <b>TRUE</b> if the filter is a renderer, or <b>FALSE</b> otherwise.
     * @param {IPin} pPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface on the input pin of the filter.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object was already initialized.
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
     * Not enough memory to create the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iseekingpassthru-init
     */
    Init(bSupportRendering, pPin) {
        result := ComCall(3, this, "int", bSupportRendering, "ptr", pPin, "HRESULT")
        return result
    }
}

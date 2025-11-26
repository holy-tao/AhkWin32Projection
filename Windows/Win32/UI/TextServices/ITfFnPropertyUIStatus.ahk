#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnPropertyUIStatus interface is implemented by a text service and used by an application or text service to obtain and set the status of the text service property UI.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnpropertyuistatus
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnPropertyUIStatus extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnPropertyUIStatus
     * @type {Guid}
     */
    static IID => Guid("{2338ac6e-2b9d-44c0-a75e-ee64f256b3bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "SetStatus"]

    /**
     * ITfFnPropertyUIStatus::GetStatus method
     * @param {Pointer<Guid>} refguidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property</a> identifiers.
     * @returns {Integer} Pointer to a <b>DWORD</b> that recevies the property UI status. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_PROPUI_STATUS_SAVETOFILE"></a><a id="tf_propui_status_savetofile"></a><dl>
     * <dt><b>TF_PROPUI_STATUS_SAVETOFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property can be serialized. If this value is not present, the property cannot be serialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnpropertyuistatus-getstatus
     */
    GetStatus(refguidProp) {
        result := ComCall(4, this, "ptr", refguidProp, "uint*", &pdw := 0, "HRESULT")
        return pdw
    }

    /**
     * ITfFnPropertyUIStatus::SetStatus method
     * @param {Pointer<Guid>} refguidProp Specifies the property identifier. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property</a> identifiers.
     * @param {Integer} dw Contains the new property UI status. See the <i>pdw</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnpropertyuistatus-getstatus">ITfFnPropertyUIStatus::GetStatus</a> for possible values.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The text service does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnpropertyuistatus-setstatus
     */
    SetStatus(refguidProp, dw) {
        result := ComCall(5, this, "ptr", refguidProp, "uint", dw, "HRESULT")
        return result
    }
}

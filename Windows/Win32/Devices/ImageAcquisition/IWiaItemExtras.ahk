#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaItemExtras interface provides several methods that enable applications to communicate with hardware drivers.
 * @remarks
 * 
 * The <b>IWiaItemExtras</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiaitemextras
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaItemExtras extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaItemExtras
     * @type {Guid}
     */
    static IID => Guid("{6291ef2c-36ef-4532-876a-8e132593778d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtendedErrorInfo", "Escape", "CancelPendingIO"]

    /**
     * The IWiaItemExtras::GetExtendedErrorInfo method gets a string from the device driver that contains information about the most recent error.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Pointer to a string that contains the error information.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitemextras-getextendederrorinfo
     */
    GetExtendedErrorInfo() {
        bstrErrorText := BSTR()
        result := ComCall(3, this, "ptr", bstrErrorText, "HRESULT")
        return bstrErrorText
    }

    /**
     * The IWiaItemExtras::Escape method sends a request for a vendor-specific I/O operation to a still image device.
     * @param {Integer} dwEscapeCode Type: <b>DWORD</b>
     * 
     * Calling application-supplied, vendor-defined, DWORD-sized value that represents an I/O operation.
     * @param {Pointer<Integer>} lpInData Type: <b>BYTE*</b>
     * 
     * Pointer to a calling application-supplied buffer that contains data to be sent to the device.
     * @param {Integer} cbInDataSize Type: <b>DWORD</b>
     * 
     * Calling application-supplied length, in bytes, of the data contained in the buffer pointed to by <i>lpInData</i>.
     * @param {Pointer<Integer>} pOutData Type: <b>BYTE*</b>
     * 
     * Pointer to a calling application-supplied memory buffer to receive data from the device.
     * @param {Integer} dwOutDataSize Type: <b>DWORD</b>
     * 
     * Calling application-supplied length, in bytes, of the buffer pointed to by <i>pOutData</i>.
     * @param {Pointer<Integer>} pdwActualDataSize Type: <b>DWORD*</b>
     * 
     * Receives the number of bytes actually written to <i>pOutData</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitemextras-escape
     */
    Escape(dwEscapeCode, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualDataSize) {
        lpInDataMarshal := lpInData is VarRef ? "char*" : "ptr"
        pOutDataMarshal := pOutData is VarRef ? "char*" : "ptr"
        pdwActualDataSizeMarshal := pdwActualDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwEscapeCode, lpInDataMarshal, lpInData, "uint", cbInDataSize, pOutDataMarshal, pOutData, "uint", dwOutDataSize, pdwActualDataSizeMarshal, pdwActualDataSize, "HRESULT")
        return result
    }

    /**
     * The IWiaItemExtras::CancelPendingIO method cancels all pending input/output operations on the driver.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaitemextras-cancelpendingio
     */
    CancelPendingIO() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

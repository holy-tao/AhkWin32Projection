#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that retireves system id data.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsystemid
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSystemId extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSystemId
     * @type {Guid}
     */
    static IID => Guid("{fff4af3a-1fc1-4ef9-a29b-d26c49e2f31a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "Setup"]

    /**
     * Retrieves system id data.
     * @param {Pointer<Integer>} size The size in bytes of the returned data.
     * @param {Pointer<Pointer<Integer>>} data Receives the returned data.  The caller must free this buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsystemid-getdata
     */
    GetData(size, data) {
        sizeMarshal := size is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, sizeMarshal, size, dataMarshal, data, "HRESULT")
        return result
    }

    /**
     * Sets up the IMFSystemId.
     * @param {Integer} stage Stage in the setup process. 0 or 1.
     * @param {Integer} cbIn Size of the input buffer.
     * @param {Pointer} pbIn The input buffer.
     * @param {Pointer<Integer>} pcbOut Size of output buffer.
     * @param {Pointer<Pointer<Integer>>} ppbOut The output buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsystemid-setup
     */
    Setup(stage, cbIn, pbIn, pcbOut, ppbOut) {
        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"
        ppbOutMarshal := ppbOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", stage, "uint", cbIn, "ptr", pbIn, pcbOutMarshal, pcbOut, ppbOutMarshal, ppbOut, "HRESULT")
        return result
    }
}

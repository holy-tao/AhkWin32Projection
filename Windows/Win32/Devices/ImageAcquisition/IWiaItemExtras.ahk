#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} bstrErrorText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitemextras-getextendederrorinfo
     */
    GetExtendedErrorInfo(bstrErrorText) {
        result := ComCall(3, this, "ptr", bstrErrorText, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @param {Integer} dwEscapeCode 
     * @param {Pointer<Integer>} lpInData 
     * @param {Integer} cbInDataSize 
     * @param {Pointer<Integer>} pOutData 
     * @param {Integer} dwOutDataSize 
     * @param {Pointer<Integer>} pdwActualDataSize 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     */
    Escape(dwEscapeCode, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualDataSize) {
        lpInDataMarshal := lpInData is VarRef ? "char*" : "ptr"
        pOutDataMarshal := pOutData is VarRef ? "char*" : "ptr"
        pdwActualDataSizeMarshal := pdwActualDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwEscapeCode, lpInDataMarshal, lpInData, "uint", cbInDataSize, pOutDataMarshal, pOutData, "uint", dwOutDataSize, pdwActualDataSizeMarshal, pdwActualDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitemextras-cancelpendingio
     */
    CancelPendingIO() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk

/**
 * The ITfRangeACP interface is implemented by the TSF manager and is used by an application character position (ACP)-based application to access and manipulate range objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfrangeacp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfRangeACP extends ITfRange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfRangeACP
     * @type {Guid}
     */
    static IID => Guid("{057a6296-029b-4154-b79a-0d461d4ea94c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtent", "SetExtent"]

    /**
     * 
     * @param {Pointer<Integer>} pacpAnchor 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrangeacp-getextent
     */
    GetExtent(pacpAnchor, pcch) {
        pacpAnchorMarshal := pacpAnchor is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pacpAnchorMarshal, pacpAnchor, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} acpAnchor 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrangeacp-setextent
     */
    SetExtent(acpAnchor, cch) {
        result := ComCall(26, this, "int", acpAnchor, "int", cch, "HRESULT")
        return result
    }
}

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
     * 
     * @param {Pointer<Int32>} pacpAnchor 
     * @param {Pointer<Int32>} pcch 
     * @returns {HRESULT} 
     */
    GetExtent(pacpAnchor, pcch) {
        result := ComCall(25, this, "int*", pacpAnchor, "int*", pcch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpAnchor 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    SetExtent(acpAnchor, cch) {
        result := ComCall(26, this, "int", acpAnchor, "int", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

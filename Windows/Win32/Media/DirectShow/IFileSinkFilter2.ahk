#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileSinkFilter.ahk

/**
 * The IFileSinkFilter2 interface extends the IFileSinkFilter interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifilesinkfilter2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFileSinkFilter2 extends IFileSinkFilter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSinkFilter2
     * @type {Guid}
     */
    static IID => Guid("{00855b90-ce1b-11d0-bd4f-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMode", "GetMode"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter2-setmode
     */
    SetMode(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter2-getmode
     */
    GetMode(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }
}

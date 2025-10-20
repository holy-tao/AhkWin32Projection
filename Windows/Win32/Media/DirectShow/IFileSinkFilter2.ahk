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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetMode(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetMode(pdwFlags) {
        result := ComCall(6, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

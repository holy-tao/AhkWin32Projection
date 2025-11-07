#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConfigAviMux interface configures the AVI Mux filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iconfigavimux
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAviMux extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigAviMux
     * @type {Guid}
     */
    static IID => Guid("{5acd6aa0-f482-11ce-8b67-00aa00a3f1a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMasterStream", "GetMasterStream", "SetOutputCompatibilityIndex", "GetOutputCompatibilityIndex"]

    /**
     * 
     * @param {Integer} iStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-setmasterstream
     */
    SetMasterStream(iStream) {
        result := ComCall(3, this, "int", iStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-getmasterstream
     */
    GetMasterStream() {
        result := ComCall(4, this, "int*", &pStream := 0, "HRESULT")
        return pStream
    }

    /**
     * 
     * @param {BOOL} fOldIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-setoutputcompatibilityindex
     */
    SetOutputCompatibilityIndex(fOldIndex) {
        result := ComCall(5, this, "int", fOldIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-getoutputcompatibilityindex
     */
    GetOutputCompatibilityIndex() {
        result := ComCall(6, this, "int*", &pfOldIndex := 0, "HRESULT")
        return pfOldIndex
    }
}

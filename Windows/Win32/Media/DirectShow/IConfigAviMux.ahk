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
     * 
     * @param {Integer} iStream 
     * @returns {HRESULT} 
     */
    SetMasterStream(iStream) {
        result := ComCall(3, this, "int", iStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStream 
     * @returns {HRESULT} 
     */
    GetMasterStream(pStream) {
        result := ComCall(4, this, "int*", pStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fOldIndex 
     * @returns {HRESULT} 
     */
    SetOutputCompatibilityIndex(fOldIndex) {
        result := ComCall(5, this, "int", fOldIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfOldIndex 
     * @returns {HRESULT} 
     */
    GetOutputCompatibilityIndex(pfOldIndex) {
        result := ComCall(6, this, "ptr", pfOldIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

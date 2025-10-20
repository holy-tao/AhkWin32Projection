#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConfigInterleaving interface controls how the AVI Mux filter interleaves audio and video samples.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iconfiginterleaving
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigInterleaving extends IUnknown{
    /**
     * The interface identifier for IConfigInterleaving
     * @type {Guid}
     */
    static IID => Guid("{bee3d220-157b-11d0-bd23-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    put_Mode(mode) {
        result := ComCall(3, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMode 
     * @returns {HRESULT} 
     */
    get_Mode(pMode) {
        result := ComCall(4, this, "int*", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} prtInterleave 
     * @param {Pointer<Int64>} prtPreroll 
     * @returns {HRESULT} 
     */
    put_Interleaving(prtInterleave, prtPreroll) {
        result := ComCall(5, this, "int64*", prtInterleave, "int64*", prtPreroll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} prtInterleave 
     * @param {Pointer<Int64>} prtPreroll 
     * @returns {HRESULT} 
     */
    get_Interleaving(prtInterleave, prtPreroll) {
        result := ComCall(6, this, "int64*", prtInterleave, "int64*", prtPreroll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

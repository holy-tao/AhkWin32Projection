#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDataConvert extends IUnknown{
    /**
     * The interface identifier for IDataConvert
     * @type {Guid}
     */
    static IID => Guid("{0c733a8d-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @param {Pointer} cbSrcLength 
     * @param {Pointer<UIntPtr>} pcbDstLength 
     * @param {Pointer} pSrc 
     * @param {Pointer<Void>} pDst 
     * @param {Pointer} cbDstMaxLength 
     * @param {Integer} dbsSrcStatus 
     * @param {Pointer<UInt32>} pdbsStatus 
     * @param {Integer} bPrecision 
     * @param {Integer} bScale 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    DataConvert(wSrcType, wDstType, cbSrcLength, pcbDstLength, pSrc, pDst, cbDstMaxLength, dbsSrcStatus, pdbsStatus, bPrecision, bScale, dwFlags) {
        result := ComCall(3, this, "ushort", wSrcType, "ushort", wDstType, "ptr", cbSrcLength, "ptr*", pcbDstLength, "ptr", pSrc, "ptr", pDst, "ptr", cbDstMaxLength, "uint", dbsSrcStatus, "uint*", pdbsStatus, "char", bPrecision, "char", bScale, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @returns {HRESULT} 
     */
    CanConvert(wSrcType, wDstType) {
        result := ComCall(4, this, "ushort", wSrcType, "ushort", wDstType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @param {Pointer<UIntPtr>} pcbSrcLength 
     * @param {Pointer<UIntPtr>} pcbDstLength 
     * @param {Pointer} pSrc 
     * @returns {HRESULT} 
     */
    GetConversionSize(wSrcType, wDstType, pcbSrcLength, pcbDstLength, pSrc) {
        result := ComCall(5, this, "ushort", wSrcType, "ushort", wDstType, "ptr*", pcbSrcLength, "ptr*", pcbDstLength, "ptr", pSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

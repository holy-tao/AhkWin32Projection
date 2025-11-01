#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDataConvert extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DataConvert", "CanConvert", "GetConversionSize"]

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @param {Pointer} cbSrcLength 
     * @param {Pointer<Pointer>} pcbDstLength 
     * @param {Pointer} pSrc 
     * @param {Pointer<Void>} pDst 
     * @param {Pointer} cbDstMaxLength 
     * @param {Integer} dbsSrcStatus 
     * @param {Pointer<Integer>} pdbsStatus 
     * @param {Integer} bPrecision 
     * @param {Integer} bScale 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    DataConvert(wSrcType, wDstType, cbSrcLength, pcbDstLength, pSrc, pDst, cbDstMaxLength, dbsSrcStatus, pdbsStatus, bPrecision, bScale, dwFlags) {
        pcbDstLengthMarshal := pcbDstLength is VarRef ? "ptr*" : "ptr"
        pDstMarshal := pDst is VarRef ? "ptr" : "ptr"
        pdbsStatusMarshal := pdbsStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ushort", wSrcType, "ushort", wDstType, "ptr", cbSrcLength, pcbDstLengthMarshal, pcbDstLength, "ptr", pSrc, pDstMarshal, pDst, "ptr", cbDstMaxLength, "uint", dbsSrcStatus, pdbsStatusMarshal, pdbsStatus, "char", bPrecision, "char", bScale, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @returns {HRESULT} 
     */
    CanConvert(wSrcType, wDstType) {
        result := ComCall(4, this, "ushort", wSrcType, "ushort", wDstType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @param {Pointer<Pointer>} pcbSrcLength 
     * @param {Pointer<Pointer>} pcbDstLength 
     * @param {Pointer} pSrc 
     * @returns {HRESULT} 
     */
    GetConversionSize(wSrcType, wDstType, pcbSrcLength, pcbDstLength, pSrc) {
        pcbSrcLengthMarshal := pcbSrcLength is VarRef ? "ptr*" : "ptr"
        pcbDstLengthMarshal := pcbDstLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ushort", wSrcType, "ushort", wDstType, pcbSrcLengthMarshal, pcbSrcLength, pcbDstLengthMarshal, pcbDstLength, "ptr", pSrc, "HRESULT")
        return result
    }
}

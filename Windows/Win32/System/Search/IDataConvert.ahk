#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDataConvert extends IUnknown {
    /**
     * The interface identifier for IDataConvert
     * @type {Guid}
     */
    static IID := Guid("{0c733a8d-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataConvert interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DataConvert       : IntPtr
        CanConvert        : IntPtr
        GetConversionSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataConvert.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} wSrcType 
     * @param {Integer} wDstType 
     * @param {Pointer} cbSrcLength 
     * @param {Pointer<Pointer>} pcbDstLength 
     * @param {Integer} pSrc 
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
     * @param {Integer} pSrc 
     * @returns {Pointer} 
     */
    GetConversionSize(wSrcType, wDstType, pcbSrcLength, pSrc) {
        pcbSrcLengthMarshal := pcbSrcLength is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ushort", wSrcType, "ushort", wDstType, pcbSrcLengthMarshal, pcbSrcLength, "ptr*", &pcbDstLength := 0, "ptr", pSrc, "HRESULT")
        return pcbDstLength
    }

    Query(iid) {
        if (IDataConvert.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DataConvert := CallbackCreate(GetMethod(implObj, "DataConvert"), flags, 13)
        this.vtbl.CanConvert := CallbackCreate(GetMethod(implObj, "CanConvert"), flags, 3)
        this.vtbl.GetConversionSize := CallbackCreate(GetMethod(implObj, "GetConversionSize"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DataConvert)
        CallbackFree(this.vtbl.CanConvert)
        CallbackFree(this.vtbl.GetConversionSize)
    }
}

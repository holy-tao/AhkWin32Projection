#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostType5.ahk" { IDebugHostType5 }
#Import ".\IDebugHostTaggedUnionRangeEnumerator.ahk" { IDebugHostTaggedUnionRangeEnumerator }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostType6 extends IDebugHostType5 {
    /**
     * The interface identifier for IDebugHostType6
     * @type {Guid}
     */
    static IID := Guid("{08b431ed-f684-4480-8c44-b543aa32ceb0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostType6 interfaces
    */
    struct Vtbl extends IDebugHostType5.Vtbl {
        GetTaggedUnionTag       : IntPtr
        GetTaggedUnionTagRanges : IntPtr
        UpcastToTaggedUnionType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostType6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} pTagType 
     * @param {Pointer<Integer>} pTagOffset 
     * @param {Pointer<VARIANT>} pTagMask 
     * @returns {HRESULT} 
     */
    GetTaggedUnionTag(pTagType, pTagOffset, pTagMask) {
        pTagOffsetMarshal := pTagOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, IDebugHostType.Ptr, pTagType, pTagOffsetMarshal, pTagOffset, VARIANT.Ptr, pTagMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugHostTaggedUnionRangeEnumerator} 
     */
    GetTaggedUnionTagRanges() {
        result := ComCall(40, this, "ptr*", &pTagRangeEnumerator := 0, "HRESULT")
        return IDebugHostTaggedUnionRangeEnumerator(pTagRangeEnumerator)
    }

    /**
     * 
     * @param {IDebugHostType} pTaggedUnionType 
     * @returns {IDebugHostType} 
     */
    UpcastToTaggedUnionType(pTaggedUnionType) {
        result := ComCall(41, this, "ptr", pTaggedUnionType, "ptr*", &pUpcastedCaseType := 0, "HRESULT")
        return IDebugHostType(pUpcastedCaseType)
    }

    Query(iid) {
        if (IDebugHostType6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTaggedUnionTag := CallbackCreate(GetMethod(implObj, "GetTaggedUnionTag"), flags, 4)
        this.vtbl.GetTaggedUnionTagRanges := CallbackCreate(GetMethod(implObj, "GetTaggedUnionTagRanges"), flags, 2)
        this.vtbl.UpcastToTaggedUnionType := CallbackCreate(GetMethod(implObj, "UpcastToTaggedUnionType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTaggedUnionTag)
        CallbackFree(this.vtbl.GetTaggedUnionTagRanges)
        CallbackFree(this.vtbl.UpcastToTaggedUnionType)
    }
}

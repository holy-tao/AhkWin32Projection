#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\FA_ENTRY.ahk" { FA_ENTRY }
#Import ".\DEBUG_FLR_PARAM_TYPE.ahk" { DEBUG_FLR_PARAM_TYPE }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEBUG_FAILURE_TYPE.ahk" { DEBUG_FAILURE_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugFailureAnalysis extends IUnknown {
    /**
     * The interface identifier for IDebugFailureAnalysis
     * @type {Guid}
     */
    static IID := Guid("{ed0de363-451f-4943-820c-62dccdfa7e6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugFailureAnalysis interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFailureClass : IntPtr
        GetFailureType  : IntPtr
        GetFailureCode  : IntPtr
        Get             : IntPtr
        GetNext         : IntPtr
        GetString       : IntPtr
        GetBuffer       : IntPtr
        GetUlong        : IntPtr
        GetUlong64      : IntPtr
        NextEntry       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugFailureAnalysis.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureClass() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * 
     * @returns {DEBUG_FAILURE_TYPE} 
     */
    GetFailureType() {
        result := ComCall(4, this, DEBUG_FAILURE_TYPE)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureCode() {
        result := ComCall(5, this, UInt32)
        return result
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(Tag) {
        result := ComCall(6, this, DEBUG_FLR_PARAM_TYPE, Tag, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {DEBUG_FLR_PARAM_TYPE} TagMask 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetNext(Entry, Tag, TagMask) {
        result := ComCall(7, this, FA_ENTRY.Ptr, Entry, DEBUG_FLR_PARAM_TYPE, Tag, DEBUG_FLR_PARAM_TYPE, TagMask, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Str 
     * @param {Integer} MaxSize 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetString(Tag, Str, MaxSize) {
        result := ComCall(8, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Str, "uint", MaxSize, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Buf 
     * @param {Integer} _Size 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetBuffer(Tag, Buf, _Size) {
        result := ComCall(9, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Buf, "uint", _Size, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong(Tag, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, DEBUG_FLR_PARAM_TYPE, Tag, ValueMarshal, Value, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Pointer<Integer>} Value 
     * @returns {Pointer<FA_ENTRY>} 
     */
    GetUlong64(Tag, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, DEBUG_FLR_PARAM_TYPE, Tag, ValueMarshal, Value, FA_ENTRY.Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @returns {Pointer<FA_ENTRY>} 
     */
    NextEntry(Entry) {
        result := ComCall(12, this, FA_ENTRY.Ptr, Entry, FA_ENTRY.Ptr)
        return result
    }

    Query(iid) {
        if (IDebugFailureAnalysis.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFailureClass := CallbackCreate(GetMethod(implObj, "GetFailureClass"), flags, 1)
        this.vtbl.GetFailureType := CallbackCreate(GetMethod(implObj, "GetFailureType"), flags, 1)
        this.vtbl.GetFailureCode := CallbackCreate(GetMethod(implObj, "GetFailureCode"), flags, 1)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 2)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 4)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 4)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 4)
        this.vtbl.GetUlong := CallbackCreate(GetMethod(implObj, "GetUlong"), flags, 3)
        this.vtbl.GetUlong64 := CallbackCreate(GetMethod(implObj, "GetUlong64"), flags, 3)
        this.vtbl.NextEntry := CallbackCreate(GetMethod(implObj, "NextEntry"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFailureClass)
        CallbackFree(this.vtbl.GetFailureType)
        CallbackFree(this.vtbl.GetFailureCode)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.GetNext)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.GetUlong)
        CallbackFree(this.vtbl.GetUlong64)
        CallbackFree(this.vtbl.NextEntry)
    }
}

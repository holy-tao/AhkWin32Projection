#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\FA_ENTRY.ahk
#Include .\DEBUG_FAILURE_TYPE.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include .\DEBUG_FLR_PARAM_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugFailureAnalysis extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugFailureAnalysis
     * @type {Guid}
     */
    static IID => Guid("{ed0de363-451f-4943-820c-62dccdfa7e6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFailureClass", "GetFailureType", "GetFailureCode", "Get", "GetNext", "GetString", "GetBuffer", "GetUlong", "GetUlong64", "NextEntry"]

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureClass() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {DEBUG_FAILURE_TYPE} 
     */
    GetFailureType() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFailureCode() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Get started learning the basics of building great desktop apps in this section.
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {Pointer<FA_ENTRY>} 
     * @see https://learn.microsoft.com/windows/win32/desktop-programming
     */
    Get(Tag) {
        result := ComCall(6, this, "int", Tag, "ptr")
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
        result := ComCall(7, this, "ptr", Entry, "int", Tag, "int", TagMask, "ptr")
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
        result := ComCall(8, this, "int", Tag, "ptr", Str, "uint", MaxSize, "ptr")
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
        result := ComCall(9, this, "int", Tag, "ptr", Buf, "uint", _Size, "ptr")
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

        result := ComCall(10, this, "int", Tag, ValueMarshal, Value, "ptr")
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

        result := ComCall(11, this, "int", Tag, ValueMarshal, Value, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FA_ENTRY>} Entry 
     * @returns {Pointer<FA_ENTRY>} 
     */
    NextEntry(Entry) {
        result := ComCall(12, this, "ptr", Entry, "ptr")
        return result
    }
}

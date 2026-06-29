#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostMemory4.ahk" { IDebugHostMemory4 }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostMemory5 extends IDebugHostMemory4 {
    /**
     * The interface identifier for IDebugHostMemory5
     * @type {Guid}
     */
    static IID := Guid("{df033400-4912-46e9-ba62-6ef2eb4d87d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostMemory5 interfaces
    */
    struct Vtbl extends IDebugHostMemory4.Vtbl {
        ReadIntrinsics        : IntPtr
        ReadOrdinalIntrinsics : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostMemory5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} vt 
     * @param {Integer} count 
     * @param {Pointer<VARIANT>} vals 
     * @param {Pointer<Integer>} intrinsicsRead 
     * @returns {HRESULT} 
     */
    ReadIntrinsics(_context, _location, vt, count, vals, intrinsicsRead) {
        intrinsicsReadMarshal := intrinsicsRead is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", _context, Location, _location, "ushort", vt, "uint", count, VARIANT.Ptr, vals, intrinsicsReadMarshal, intrinsicsRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} ordinalSize 
     * @param {Integer} ordinalIsSigned 
     * @param {Integer} count 
     * @param {Pointer<VARIANT>} vals 
     * @param {Pointer<Integer>} intrinsicsRead 
     * @returns {HRESULT} 
     */
    ReadOrdinalIntrinsics(_context, _location, ordinalSize, ordinalIsSigned, count, vals, intrinsicsRead) {
        intrinsicsReadMarshal := intrinsicsRead is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", _context, Location, _location, "uint", ordinalSize, "char", ordinalIsSigned, "uint", count, VARIANT.Ptr, vals, intrinsicsReadMarshal, intrinsicsRead, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostMemory5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadIntrinsics := CallbackCreate(GetMethod(implObj, "ReadIntrinsics"), flags, 7)
        this.vtbl.ReadOrdinalIntrinsics := CallbackCreate(GetMethod(implObj, "ReadOrdinalIntrinsics"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadIntrinsics)
        CallbackFree(this.vtbl.ReadOrdinalIntrinsics)
    }
}

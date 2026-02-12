#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostMemory4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory5 extends IDebugHostMemory4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostMemory5
     * @type {Guid}
     */
    static IID => Guid("{df033400-4912-46e9-ba62-6ef2eb4d87d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadIntrinsics", "ReadOrdinalIntrinsics"]

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Integer} vt 
     * @param {Integer} count 
     * @param {Pointer<VARIANT>} vals 
     * @param {Pointer<Integer>} intrinsicsRead 
     * @returns {HRESULT} 
     */
    ReadIntrinsics(context_, location_, vt, count, vals, intrinsicsRead) {
        intrinsicsReadMarshal := intrinsicsRead is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", context_, "ptr", location_, "ushort", vt, "uint", count, "ptr", vals, intrinsicsReadMarshal, intrinsicsRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Integer} ordinalSize 
     * @param {Integer} ordinalIsSigned 
     * @param {Integer} count 
     * @param {Pointer<VARIANT>} vals 
     * @param {Pointer<Integer>} intrinsicsRead 
     * @returns {HRESULT} 
     */
    ReadOrdinalIntrinsics(context_, location_, ordinalSize, ordinalIsSigned, count, vals, intrinsicsRead) {
        intrinsicsReadMarshal := intrinsicsRead is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", context_, "ptr", location_, "uint", ordinalSize, "char", ordinalIsSigned, "uint", count, "ptr", vals, intrinsicsReadMarshal, intrinsicsRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

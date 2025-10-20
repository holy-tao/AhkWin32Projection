#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostMemory4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory5 extends IDebugHostMemory4{
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
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Integer} vt 
     * @param {Integer} count 
     * @param {Pointer<VARIANT>} vals 
     * @param {Pointer<UInt64>} intrinsicsRead 
     * @returns {HRESULT} 
     */
    ReadIntrinsics(context, location, vt, count, vals, intrinsicsRead) {
        result := ComCall(12, this, "ptr", context, "ptr", location, "ushort", vt, "uint", count, "ptr", vals, "uint*", intrinsicsRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Integer} ordinalSize 
     * @param {Integer} ordinalIsSigned 
     * @param {Integer} count 
     * @param {Pointer<VARIANT>} vals 
     * @param {Pointer<UInt64>} intrinsicsRead 
     * @returns {HRESULT} 
     */
    ReadOrdinalIntrinsics(context, location, ordinalSize, ordinalIsSigned, count, vals, intrinsicsRead) {
        result := ComCall(13, this, "ptr", context, "ptr", location, "uint", ordinalSize, "char", ordinalIsSigned, "uint", count, "ptr", vals, "uint*", intrinsicsRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

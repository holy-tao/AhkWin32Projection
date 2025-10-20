#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalStorage2 extends IUnknown{
    /**
     * The interface identifier for IDebugHostFunctionLocalStorage2
     * @type {Guid}
     */
    static IID => Guid("{213b3725-36a2-45a0-9ea4-854d46d85195}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} registerId 
     * @param {Pointer<Int64>} offset 
     * @param {Pointer<Boolean>} isIndirectAccess 
     * @param {Pointer<Int32>} indirectOffset 
     * @returns {HRESULT} 
     */
    GetExtendedRegisterAddressInfo(registerId, offset, isIndirectAccess, indirectOffset) {
        result := ComCall(3, this, "uint*", registerId, "int64*", offset, "int*", isIndirectAccess, "int*", indirectOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

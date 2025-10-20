#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalStorage2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtendedRegisterAddressInfo"]

    /**
     * 
     * @param {Pointer<Integer>} registerId 
     * @param {Pointer<Integer>} offset 
     * @param {Pointer<Boolean>} isIndirectAccess 
     * @param {Pointer<Integer>} indirectOffset 
     * @returns {HRESULT} 
     */
    GetExtendedRegisterAddressInfo(registerId, offset, isIndirectAccess, indirectOffset) {
        result := ComCall(3, this, "uint*", registerId, "int64*", offset, "int*", isIndirectAccess, "int*", indirectOffset, "HRESULT")
        return result
    }
}

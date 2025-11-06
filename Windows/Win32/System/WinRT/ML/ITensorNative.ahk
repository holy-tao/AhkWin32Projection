#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ITensorNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorNative
     * @type {Guid}
     */
    static IID => Guid("{52f547ef-5b03-49b5-82d6-565f1ee0dd49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "GetD3D12Resource"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} value 
     * @param {Pointer<Integer>} capacity 
     * @returns {HRESULT} 
     */
    GetBuffer(value, capacity) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"
        capacityMarshal := capacity is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, valueMarshal, value, capacityMarshal, capacity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ID3D12Resource} 
     */
    GetD3D12Resource() {
        result := ComCall(4, this, "ptr*", &result := 0, "HRESULT")
        return ID3D12Resource(result)
    }
}

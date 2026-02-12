#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandModem4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModem4
     * @type {Guid}
     */
    static IID => Guid("{4a0398c2-91be-412b-b569-586e9f0030d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIsPassthroughEnabledWithSlotIndexAsync", "GetIsPassthroughEnabledWithSlotIndexAsync", "SetIsPassthroughEnabledWithSlotIndex", "GetIsPassthroughEnabledWithSlotIndex"]

    /**
     * 
     * @param {Boolean} value 
     * @param {Integer} slotindex 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetIsPassthroughEnabledWithSlotIndexAsync(value, slotindex) {
        result := ComCall(6, this, "int", value, "int", slotindex, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Integer} slotindex 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsPassthroughEnabledWithSlotIndexAsync(slotindex) {
        result := ComCall(7, this, "int", slotindex, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Boolean} value 
     * @param {Integer} slotindex 
     * @returns {Integer} 
     */
    SetIsPassthroughEnabledWithSlotIndex(value, slotindex) {
        result := ComCall(8, this, "int", value, "int", slotindex, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} slotindex 
     * @returns {Boolean} 
     */
    GetIsPassthroughEnabledWithSlotIndex(slotindex) {
        result := ComCall(9, this, "int", slotindex, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

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
class IMobileBroadbandModem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModem2
     * @type {Guid}
     */
    static IID => Guid("{12862b28-b9eb-4ee2-bbe3-711f53eea373}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIsPassthroughEnabledAsync", "SetIsPassthroughEnabledAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsPassthroughEnabledAsync() {
        result := ComCall(6, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), asyncInfo)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetIsPassthroughEnabledAsync(value) {
        result := ComCall(7, this, "int", value, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncInfo)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCard.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SmartCardChallengeContext.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardProvisioning extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardProvisioning
     * @type {Guid}
     */
    static IID => Guid("{19eeedbd-1fab-477c-b712-1a2c5af1fd6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmartCard", "GetIdAsync", "GetNameAsync", "GetChallengeContextAsync", "RequestPinChangeAsync", "RequestPinResetAsync"]

    /**
     * @type {SmartCard} 
     */
    SmartCard {
        get => this.get_SmartCard()
    }

    /**
     * 
     * @returns {SmartCard} 
     */
    get_SmartCard() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCard(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Guid>} 
     */
    GetIdAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetGuid(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetNameAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<SmartCardChallengeContext>} 
     */
    GetChallengeContextAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardChallengeContext, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestPinChangeAsync() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {SmartCardPinResetHandler} handler 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestPinResetAsync(handler) {
        result := ComCall(11, this, "ptr", handler, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}

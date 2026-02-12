#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardChallengeContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardChallengeContext
     * @type {Guid}
     */
    static IID => Guid("{192a5319-c9c4-4947-81cc-44794a61ef91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Challenge", "VerifyResponseAsync", "ProvisionAsync", "ProvisionAsyncWithNewCardId", "ChangeAdministrativeKeyAsync"]

    /**
     * @type {IBuffer} 
     */
    Challenge {
        get => this.get_Challenge()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Challenge() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} response 
     * @returns {IAsyncOperation<Boolean>} 
     */
    VerifyResponseAsync(response) {
        result := ComCall(7, this, "ptr", response, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {IBuffer} response 
     * @param {Boolean} formatCard 
     * @returns {IAsyncAction} 
     */
    ProvisionAsync(response, formatCard) {
        result := ComCall(8, this, "ptr", response, "int", formatCard, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IBuffer} response 
     * @param {Boolean} formatCard 
     * @param {Guid} newCardId 
     * @returns {IAsyncAction} 
     */
    ProvisionAsyncWithNewCardId(response, formatCard, newCardId) {
        result := ComCall(9, this, "ptr", response, "int", formatCard, "ptr", newCardId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IBuffer} response 
     * @param {IBuffer} newAdministrativeKey 
     * @returns {IAsyncAction} 
     */
    ChangeAdministrativeKeyAsync(response, newAdministrativeKey) {
        result := ComCall(10, this, "ptr", response, "ptr", newAdministrativeKey, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}

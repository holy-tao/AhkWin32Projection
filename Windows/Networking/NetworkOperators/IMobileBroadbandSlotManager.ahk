#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandSlotInfo.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandSlotManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandSlotManager
     * @type {Guid}
     */
    static IID => Guid("{eba07cd6-2019-5f81-a294-cc364a11d0b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SlotInfos", "get_CurrentSlotIndex", "SetCurrentSlot", "SetCurrentSlotAsync", "add_SlotInfoChanged", "remove_SlotInfoChanged", "add_CurrentSlotIndexChanged", "remove_CurrentSlotIndexChanged"]

    /**
     * @type {IVectorView<MobileBroadbandSlotInfo>} 
     */
    SlotInfos {
        get => this.get_SlotInfos()
    }

    /**
     * @type {Integer} 
     */
    CurrentSlotIndex {
        get => this.get_CurrentSlotIndex()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandSlotInfo>} 
     */
    get_SlotInfos() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandSlotInfo, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentSlotIndex() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} slotIndex 
     * @returns {Integer} 
     */
    SetCurrentSlot(slotIndex) {
        result := ComCall(8, this, "int", slotIndex, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} slotIndex 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetCurrentSlotAsync(slotIndex) {
        result := ComCall(9, this, "int", slotIndex, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandSlotManager, MobileBroadbandSlotInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SlotInfoChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SlotInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandSlotManager, MobileBroadbandCurrentSlotIndexChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentSlotIndexChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentSlotIndexChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

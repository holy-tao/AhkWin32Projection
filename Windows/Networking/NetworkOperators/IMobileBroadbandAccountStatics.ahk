#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MobileBroadbandAccount.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandAccountStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandAccountStatics
     * @type {Guid}
     */
    static IID => Guid("{aa7f4d24-afc1-4fc8-ae9a-a9175310faad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AvailableNetworkAccountIds", "CreateFromNetworkAccountId"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    AvailableNetworkAccountIds {
        get => this.get_AvailableNetworkAccountIds()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AvailableNetworkAccountIds() {
        result := ComCall(6, this, "ptr*", &ppAccountIds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), ppAccountIds)
    }

    /**
     * 
     * @param {HSTRING} networkAccountId 
     * @returns {MobileBroadbandAccount} 
     */
    CreateFromNetworkAccountId(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(7, this, "ptr", networkAccountId, "ptr*", &ppAccount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandAccount(ppAccount)
    }
}

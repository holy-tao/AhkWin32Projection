#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UserActivityChannel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityChannelStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityChannelStatics2
     * @type {Guid}
     */
    static IID => Guid("{8e87de30-aa4f-4624-9ad0-d40f3ba0317c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableAutoSessionCreation", "TryGetForWebAccount"]

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableAutoSessionCreation() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WebAccount} account 
     * @returns {UserActivityChannel} 
     */
    TryGetForWebAccount(account) {
        result := ComCall(7, this, "ptr", account, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivityChannel(result_)
    }
}

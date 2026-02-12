#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastTriggerProviderInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastTrigger
     * @type {Guid}
     */
    static IID => Guid("{74d4f496-8d37-44ec-9481-2a0b9854eb48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ProviderInfo", "get_ProviderInfo"]

    /**
     * @type {AppBroadcastTriggerProviderInfo} 
     */
    ProviderInfo {
        get => this.get_ProviderInfo()
        set => this.put_ProviderInfo(value)
    }

    /**
     * 
     * @param {AppBroadcastTriggerProviderInfo} value 
     * @returns {HRESULT} 
     */
    put_ProviderInfo(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBroadcastTriggerProviderInfo} 
     */
    get_ProviderInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastTriggerProviderInfo(value)
    }
}

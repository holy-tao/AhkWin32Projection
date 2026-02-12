#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppBroadcastTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{280b9f44-22f4-4618-a02e-e7e411eb7238}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAppBroadcastTrigger"]

    /**
     * 
     * @param {HSTRING} providerKey 
     * @returns {AppBroadcastTrigger} 
     */
    CreateAppBroadcastTrigger(providerKey) {
        if(providerKey is String) {
            pin := HSTRING.Create(providerKey)
            providerKey := pin.Value
        }
        providerKey := providerKey is Win32Handle ? NumGet(providerKey, "ptr") : providerKey

        result := ComCall(6, this, "ptr", providerKey, "ptr*", &broadcastTrigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastTrigger(broadcastTrigger)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketListener2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketListener2
     * @type {Guid}
     */
    static IID => Guid("{658dc13e-bb3e-4458-b232-ed1088694b98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindServiceNameWithProtectionLevelAsync", "BindServiceNameWithProtectionLevelAndAdapterAsync"]

    /**
     * 
     * @param {HSTRING} localServiceName 
     * @param {Integer} protectionLevel 
     * @returns {IAsyncAction} 
     */
    BindServiceNameWithProtectionLevelAsync(localServiceName, protectionLevel) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(6, this, "ptr", localServiceName, "int", protectionLevel, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} localServiceName 
     * @param {Integer} protectionLevel 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncAction} 
     */
    BindServiceNameWithProtectionLevelAndAdapterAsync(localServiceName, protectionLevel, adapter_) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(7, this, "ptr", localServiceName, "int", protectionLevel, "ptr", adapter_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

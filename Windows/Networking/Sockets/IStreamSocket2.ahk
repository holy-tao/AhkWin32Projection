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
class IStreamSocket2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocket2
     * @type {Guid}
     */
    static IID => Guid("{29d0e575-f314-4d09-adf0-0fbd967fbd9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectWithProtectionLevelAndAdapterAsync"]

    /**
     * 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @param {Integer} protectionLevel 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncAction} 
     */
    ConnectWithProtectionLevelAndAdapterAsync(remoteHostName, remoteServiceName, protectionLevel, adapter_) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(6, this, "ptr", remoteHostName, "ptr", remoteServiceName, "int", protectionLevel, "ptr", adapter_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

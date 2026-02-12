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
class IDatagramSocket2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatagramSocket2
     * @type {Guid}
     */
    static IID => Guid("{d83ba354-9a9d-4185-a20a-1424c9c2a7cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindServiceNameAndAdapterAsync"]

    /**
     * 
     * @param {HSTRING} localServiceName 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncAction} 
     */
    BindServiceNameAndAdapterAsync(localServiceName, adapter_) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(6, this, "ptr", localServiceName, "ptr", adapter_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

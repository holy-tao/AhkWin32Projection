#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StoreQueueItemStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreQueueItemCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreQueueItemCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1247df6c-b44a-439b-bb07-1d3003d005c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status"]

    /**
     * @type {StoreQueueItemStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {StoreQueueItemStatus} 
     */
    get_Status() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StoreQueueItemStatus(value)
    }
}

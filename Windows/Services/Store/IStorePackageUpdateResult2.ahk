#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\StoreQueueItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePackageUpdateResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePackageUpdateResult2
     * @type {Guid}
     */
    static IID => Guid("{071d012e-bc62-4f2e-87ea-99d801aeaf98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StoreQueueItems"]

    /**
     * @type {IVectorView<StoreQueueItem>} 
     */
    StoreQueueItems {
        get => this.get_StoreQueueItems()
    }

    /**
     * 
     * @returns {IVectorView<StoreQueueItem>} 
     */
    get_StoreQueueItems() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StoreQueueItem, value)
    }
}

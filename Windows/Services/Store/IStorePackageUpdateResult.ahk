#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePackageUpdateResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePackageUpdateResult
     * @type {Guid}
     */
    static IID => Guid("{e79142ed-61f9-4893-b4fe-cf191603af7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverallState", "get_StorePackageUpdateStatuses"]

    /**
     * @type {Integer} 
     */
    OverallState {
        get => this.get_OverallState()
    }

    /**
     * @type {IVectorView<StorePackageUpdateStatus>} 
     */
    StorePackageUpdateStatuses {
        get => this.get_StorePackageUpdateStatuses()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverallState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<StorePackageUpdateStatus>} 
     */
    get_StorePackageUpdateStatuses() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetStorePackageUpdateStatus(), value)
    }
}

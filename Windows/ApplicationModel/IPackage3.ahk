#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\PackageStatus.ahk
#Include ..\Foundation\DateTime.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include Core\AppListEntry.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage3
     * @type {Guid}
     */
    static IID => Guid("{5f738b61-f86a-4917-93d1-f1ee9d3b35d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_InstalledDate", "GetAppListEntriesAsync"]

    /**
     * @type {PackageStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {DateTime} 
     */
    InstalledDate {
        get => this.get_InstalledDate()
    }

    /**
     * 
     * @returns {PackageStatus} 
     */
    get_Status() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageStatus(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_InstalledDate() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<AppListEntry>>} 
     */
    GetAppListEntriesAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppListEntry), operation)
    }
}

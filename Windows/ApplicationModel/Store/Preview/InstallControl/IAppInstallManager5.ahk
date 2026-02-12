#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppInstallItem.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallManager5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallManager5
     * @type {Guid}
     */
    static IID => Guid("{3cd7be4c-1be9-4f7f-b675-aa1d64a529b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppInstallItemsWithGroupSupport"]

    /**
     * @type {IVectorView<AppInstallItem>} 
     */
    AppInstallItemsWithGroupSupport {
        get => this.get_AppInstallItemsWithGroupSupport()
    }

    /**
     * 
     * @returns {IVectorView<AppInstallItem>} 
     */
    get_AppInstallItemsWithGroupSupport() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppInstallItem, value)
    }
}

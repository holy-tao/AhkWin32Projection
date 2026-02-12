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
class IAppInstallItem3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallItem3
     * @type {Guid}
     */
    static IID => Guid("{6f3dc998-dd47-433c-9234-560172d67a45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Children", "get_ItemOperationsMightAffectOtherItems"]

    /**
     * @type {IVectorView<AppInstallItem>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {Boolean} 
     */
    ItemOperationsMightAffectOtherItems {
        get => this.get_ItemOperationsMightAffectOtherItems()
    }

    /**
     * 
     * @returns {IVectorView<AppInstallItem>} 
     */
    get_Children() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppInstallItem, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ItemOperationsMightAffectOtherItems() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

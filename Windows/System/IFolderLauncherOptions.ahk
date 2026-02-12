#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include ..\Storage\IStorageItem.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IFolderLauncherOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderLauncherOptions
     * @type {Guid}
     */
    static IID => Guid("{bb91c27d-6b87-432a-bd04-776c6f5fb2ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemsToSelect"]

    /**
     * @type {IVector<IStorageItem>} 
     */
    ItemsToSelect {
        get => this.get_ItemsToSelect()
    }

    /**
     * 
     * @returns {IVector<IStorageItem>} 
     */
    get_ItemsToSelect() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IStorageItem, value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\ApplicationModel\AppDisplayInfo.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a game's display info such as its display name, description, category and a method to launch the game.
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.igamelistentry
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class IGameListEntry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameListEntry
     * @type {Guid}
     */
    static IID => Guid("{735924d3-811f-4494-b69c-c641a0c61543}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayInfo", "LaunchAsync", "get_Category", "get_Properties", "SetCategoryAsync"]

    /**
     * Provides the application’s name, description, and logo for the associated [IGameListEntry](igamelistentry.md)
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.igamelistentry.displayinfo
     * @type {AppDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * The current [GameListCategory](gamelistcategory.md) value for the associated [IGameListEntry](igamelistentry.md)
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.igamelistentry.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets a collection of all properties that pertain to the [IGameListEntry](igamelistentry.md) object.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.igamelistentry.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {AppDisplayInfo} 
     */
    get_DisplayInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppDisplayInfo(value)
    }

    /**
     * Launch the game associated with the [IGameListEntry](igamelistentry.md)
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.igamelistentry.launchasync
     */
    LaunchAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }

    /**
     * Sets the [GameListCategory](gamelistcategory.md) value for the associated [IGameListEntry](igamelistentry.md)
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {Integer} value 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.igamelistentry.setcategoryasync
     */
    SetCategoryAsync(value) {
        result := ComCall(10, this, "int", value, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\UI\Notifications\ShownTileNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ITileActivatedInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileActivatedInfo
     * @type {Guid}
     */
    static IID => Guid("{80e4a3b1-3980-4f17-b738-89194e0b8f65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecentlyShownNotifications"]

    /**
     * @type {IVectorView<ShownTileNotification>} 
     */
    RecentlyShownNotifications {
        get => this.get_RecentlyShownNotifications()
    }

    /**
     * 
     * @returns {IVectorView<ShownTileNotification>} 
     */
    get_RecentlyShownNotifications() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ShownTileNotification, value)
    }
}

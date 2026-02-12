#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TileNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileNotificationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileNotificationFactory
     * @type {Guid}
     */
    static IID => Guid("{c6abdd6e-4928-46c8-bdbf-81a047dea0d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTileNotification"]

    /**
     * 
     * @param {XmlDocument} content 
     * @returns {TileNotification} 
     */
    CreateTileNotification(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileNotification(value)
    }
}

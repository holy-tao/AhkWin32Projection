#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TileActivatedInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides additional information about the tile that launched your app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilaunchactivatedeventargs2
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ILaunchActivatedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILaunchActivatedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{0fd37ebc-9dc9-46b5-9ace-bd95d4565345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TileActivatedInfo"]

    /**
     * Gets additional information that is provided when the user launches your app from a tile. This will be **null** if the app is not launched from its tile or if the app is launched on a platform that doesn't support this property.
     * @remarks
     * You do not have to check for
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilaunchactivatedeventargs2.tileactivatedinfo
     * @type {TileActivatedInfo} 
     */
    TileActivatedInfo {
        get => this.get_TileActivatedInfo()
    }

    /**
     * 
     * @returns {TileActivatedInfo} 
     */
    get_TileActivatedInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TileActivatedInfo(value)
    }
}

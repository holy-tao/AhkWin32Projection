#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides event information when an app is launched.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilaunchactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ILaunchActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILaunchActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fbc93e26-a14a-4b4f-82b0-33bed920af52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Arguments", "get_TileId"]

    /**
     * Gets the arguments that are passed to the app during its launch activation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilaunchactivatedeventargs.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the ID of the tile that was invoked to launch the app.
     * @remarks
     * Starting with Windows 10, **TileId** behavior is different for apps that are launched after having been terminated. Previously, the **TileId** always returned the ID of the tile that launched the app. The **TileId** behavior now depends on how the app is reactivated:
     * 
     * | How the app is reactivated | Behavior of TileId |
     * |---|---|
     * | The user switches to the app by using the task switcher or by using the global back key | Returns the empty string `("")`. |
     * | The user taps the app tile | Returns the tile ID. |
     * 
     * The new behavior makes it possible to differentiate between a switch to the app versus a re-launch of the app. If your app uses tile ID information during activation, handle the `TileId==""` case. For example:
     * 
     * 
     * ```csharp
     * protected override void OnLaunched(LaunchActivatedEventArgs e)
     * {
     * ...
     *   if (e.TileId == "")
     *   {
     *     // resumed from switch/backstack
     *   }
     *   else
     *   {
     *     // resumed from tile launch
     *   }
     * ...
     * }
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ilaunchactivatedeventargs.tileid
     * @type {HSTRING} 
     */
    TileId {
        get => this.get_TileId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TileId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

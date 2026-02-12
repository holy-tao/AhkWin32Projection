#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SplashScreen.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides common properties for all activation types.
 * @remarks
 * Do not implement this interface.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{cf651713-cd08-4fd8-b697-a281b6544e2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_PreviousExecutionState", "get_SplashScreen"]

    /**
     * Gets the reason that this app is being activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before this activation.
     * @remarks
     * The app uses this information to determine whether it should restore saved state.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @remarks
     * This property is only meaningful when the app is activated under a contract that expects a window to be presented. If the contract doesn't require a window or if the app is being activated for a background task, this call will fail.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SplashScreen(value)
    }
}

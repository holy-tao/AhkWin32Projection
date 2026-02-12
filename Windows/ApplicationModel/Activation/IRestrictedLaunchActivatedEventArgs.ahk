#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides event information when a restricted app is launched.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.irestrictedlaunchactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IRestrictedLaunchActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRestrictedLaunchActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e0b7ac81-bfc3-4344-a5da-19fd5a27baae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SharedContext"]

    /**
     * Gets information about a shared context for the restricted launch.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.irestrictedlaunchactivatedeventargs.sharedcontext
     * @type {IInspectable} 
     */
    SharedContext {
        get => this.get_SharedContext()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SharedContext() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }
}

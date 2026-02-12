#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\IPwmControllerProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents methods common to all PWM providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmprovider
 * @namespace Windows.Devices.Pwm.Provider
 * @version WindowsRuntime 1.4
 */
class IPwmProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPwmProvider
     * @type {Guid}
     */
    static IID => Guid("{a3301228-52f1-47b0-9349-66ba43d25902}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControllers"]

    /**
     * Gets the controllers available on the system.
     * @returns {IVectorView<IPwmControllerProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.provider.ipwmprovider.getcontrollers
     */
    GetControllers() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IPwmControllerProvider, result_)
    }
}

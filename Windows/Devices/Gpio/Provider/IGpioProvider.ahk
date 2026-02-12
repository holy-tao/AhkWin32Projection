#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\IGpioControllerProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to general-purpose I/O (GPIO) controller providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpioprovider
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class IGpioProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioProvider
     * @type {Guid}
     */
    static IID => Guid("{44e82707-08ca-434a-afe0-d61580446f7e}")

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
     * @returns {IVectorView<IGpioControllerProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.igpioprovider.getcontrollers
     */
    GetControllers() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IGpioControllerProvider, result_)
    }
}

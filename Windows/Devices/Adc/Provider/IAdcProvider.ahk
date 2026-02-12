#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\IAdcControllerProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents methods common to all ADC providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadcprovider
 * @namespace Windows.Devices.Adc.Provider
 * @version WindowsRuntime 1.4
 */
class IAdcProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdcProvider
     * @type {Guid}
     */
    static IID => Guid("{28953668-9359-4c57-bc88-e275e81638c9}")

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
     * Gets the ADC controllers available on the system.
     * @returns {IVectorView<IAdcControllerProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadcprovider.getcontrollers
     */
    GetControllers() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IAdcControllerProvider, result_)
    }
}

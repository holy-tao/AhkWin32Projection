#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\II2cControllerProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to all I<sup>2</sup> C providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cprovider
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class II2cProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cProvider
     * @type {Guid}
     */
    static IID => Guid("{6f13083e-bf62-4fe2-a95a-f08999669818}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControllersAsync"]

    /**
     * Gets all the I<sup>2</sup> C controllers that are on the system.
     * @returns {IAsyncOperation<IVectorView<II2cControllerProvider>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cprovider.getcontrollersasync
     */
    GetControllersAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, II2cControllerProvider), operation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\ISpiControllerProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to SPI controller providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispiprovider
 * @namespace Windows.Devices.Spi.Provider
 * @version WindowsRuntime 1.4
 */
class ISpiProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiProvider
     * @type {Guid}
     */
    static IID => Guid("{96b461e2-77d4-48ce-aaa0-75715a8362cf}")

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
     * Gets all the SPI controllers on the system for the provider.
     * @returns {IAsyncOperation<IVectorView<ISpiControllerProvider>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispiprovider.getcontrollersasync
     */
    GetControllersAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ISpiControllerProvider), result_)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SpiController.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class ISpiControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{0d5229e2-138b-4e48-b964-4f2f79b9c5a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultAsync", "GetControllersAsync"]

    /**
     * 
     * @returns {IAsyncOperation<SpiController>} 
     */
    GetDefaultAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpiController, operation)
    }

    /**
     * 
     * @param {ISpiProvider} provider 
     * @returns {IAsyncOperation<IVectorView<SpiController>>} 
     */
    GetControllersAsync(provider) {
        result := ComCall(7, this, "ptr", provider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, SpiController), operation)
    }
}

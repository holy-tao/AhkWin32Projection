#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\GpioController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class IGpioControllerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioControllerStatics2
     * @type {Guid}
     */
    static IID => Guid("{912b7d20-6ca4-4106-a373-fffd346b0e5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControllersAsync", "GetDefaultAsync"]

    /**
     * 
     * @param {IGpioProvider} provider 
     * @returns {IAsyncOperation<IVectorView<GpioController>>} 
     */
    GetControllersAsync(provider) {
        result := ComCall(6, this, "ptr", provider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, GpioController), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<GpioController>} 
     */
    GetDefaultAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GpioController, operation)
    }
}

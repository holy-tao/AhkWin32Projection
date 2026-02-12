#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\I2cController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class II2cControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{40fc0365-5f05-4e7e-84bd-100db8e0aec5}")

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
     * @param {II2cProvider} provider 
     * @returns {IAsyncOperation<IVectorView<I2cController>>} 
     */
    GetControllersAsync(provider) {
        result := ComCall(6, this, "ptr", provider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, I2cController), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<I2cController>} 
     */
    GetDefaultAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(I2cController, operation)
    }
}

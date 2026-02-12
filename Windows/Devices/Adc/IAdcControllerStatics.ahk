#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AdcController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class IAdcControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdcControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{cce98e0c-01f8-4891-bc3b-be53ef279ca4}")

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
     * 
     * @param {IAdcProvider} provider 
     * @returns {IAsyncOperation<IVectorView<AdcController>>} 
     */
    GetControllersAsync(provider) {
        result := ComCall(6, this, "ptr", provider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AdcController), operation)
    }
}

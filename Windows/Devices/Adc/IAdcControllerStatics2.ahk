#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\AdcController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class IAdcControllerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdcControllerStatics2
     * @type {Guid}
     */
    static IID => Guid("{a2b93b1d-977b-4f5a-a5fe-a6abaffe6484}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultAsync"]

    /**
     * 
     * @returns {IAsyncOperation<AdcController>} 
     */
    GetDefaultAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdcController, operation)
    }
}

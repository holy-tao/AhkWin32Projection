#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PwmController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Pwm
 * @version WindowsRuntime 1.4
 */
class IPwmControllerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPwmControllerStatics2
     * @type {Guid}
     */
    static IID => Guid("{44fc5b1f-f119-4bdd-97ad-f76ef986736d}")

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
     * @returns {IAsyncOperation<PwmController>} 
     */
    GetDefaultAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PwmController, operation)
    }
}

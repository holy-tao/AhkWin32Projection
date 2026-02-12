#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipCallCoordinator4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipCallCoordinator4
     * @type {Guid}
     */
    static IID => Guid("{83737239-9311-468f-bb49-47e0dfb5d93e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReserveOneProcessCallResourcesAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    ReserveOneProcessCallResourcesAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}

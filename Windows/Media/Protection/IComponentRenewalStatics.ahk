#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IComponentRenewalStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentRenewalStatics
     * @type {Guid}
     */
    static IID => Guid("{6ffbcd67-b795-48c5-8b7b-a7c4efe202e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenewSystemComponentsAsync"]

    /**
     * 
     * @param {RevocationAndRenewalInformation} information 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    RenewSystemComponentsAsync(information) {
        result := ComCall(6, this, "ptr", information, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetInt32(), (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}

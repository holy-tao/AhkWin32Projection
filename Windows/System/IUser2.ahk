#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IUser2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUser2
     * @type {Guid}
     */
    static IID => Guid("{98ba5628-a6e3-518e-89d9-d3b2b1991a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckUserAgeConsentGroupAsync"]

    /**
     * 
     * @param {Integer} consentGroup 
     * @returns {IAsyncOperation<Integer>} 
     */
    CheckUserAgeConsentGroupAsync(consentGroup) {
        result := ComCall(6, this, "int", consentGroup, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}

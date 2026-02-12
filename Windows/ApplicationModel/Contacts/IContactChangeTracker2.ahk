#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactChangeTracker2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactChangeTracker2
     * @type {Guid}
     */
    static IID => Guid("{7f8ad0fc-9321-4d18-9c09-d708c63fcd31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTracking"]

    /**
     * @type {Boolean} 
     */
    IsTracking {
        get => this.get_IsTracking()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTracking() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

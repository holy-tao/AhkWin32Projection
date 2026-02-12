#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IGetEntitlementResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetEntitlementResult2
     * @type {Guid}
     */
    static IID => Guid("{e3906641-a981-4302-8c68-ff836666bb3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAlreadyOwned", "get_OrderId", "get_SkuId", "get_AvailabilityId"]

    /**
     * @type {Boolean} 
     */
    IsAlreadyOwned {
        get => this.get_IsAlreadyOwned()
    }

    /**
     * @type {HSTRING} 
     */
    OrderId {
        get => this.get_OrderId()
    }

    /**
     * @type {HSTRING} 
     */
    SkuId {
        get => this.get_SkuId()
    }

    /**
     * @type {HSTRING} 
     */
    AvailabilityId {
        get => this.get_AvailabilityId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAlreadyOwned() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OrderId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SkuId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AvailabilityId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

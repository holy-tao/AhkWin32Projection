#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\StoreLicense.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreAppLicense extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreAppLicense
     * @type {Guid}
     */
    static IID => Guid("{f389f9de-73c0-45ce-9bab-b2fe3e5eafd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SkuStoreId", "get_IsActive", "get_IsTrial", "get_ExpirationDate", "get_ExtendedJsonData", "get_AddOnLicenses", "get_TrialTimeRemaining", "get_IsTrialOwnedByThisUser", "get_TrialUniqueId"]

    /**
     * @type {HSTRING} 
     */
    SkuStoreId {
        get => this.get_SkuStoreId()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * @type {IMapView<HSTRING, StoreLicense>} 
     */
    AddOnLicenses {
        get => this.get_AddOnLicenses()
    }

    /**
     * @type {TimeSpan} 
     */
    TrialTimeRemaining {
        get => this.get_TrialTimeRemaining()
    }

    /**
     * @type {Boolean} 
     */
    IsTrialOwnedByThisUser {
        get => this.get_IsTrialOwnedByThisUser()
    }

    /**
     * @type {HSTRING} 
     */
    TrialUniqueId {
        get => this.get_TrialUniqueId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SkuStoreId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, StoreLicense>} 
     */
    get_AddOnLicenses() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), StoreLicense, value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrialTimeRemaining() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrialOwnedByThisUser() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TrialUniqueId() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

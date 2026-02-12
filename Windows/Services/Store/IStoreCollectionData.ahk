#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreCollectionData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreCollectionData
     * @type {Guid}
     */
    static IID => Guid("{8aa4c3b3-5bb3-441a-2ab4-4dab73d5ce67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTrial", "get_CampaignId", "get_DeveloperOfferId", "get_AcquiredDate", "get_StartDate", "get_EndDate", "get_TrialTimeRemaining", "get_ExtendedJsonData"]

    /**
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * @type {HSTRING} 
     */
    CampaignId {
        get => this.get_CampaignId()
    }

    /**
     * @type {HSTRING} 
     */
    DeveloperOfferId {
        get => this.get_DeveloperOfferId()
    }

    /**
     * @type {DateTime} 
     */
    AcquiredDate {
        get => this.get_AcquiredDate()
    }

    /**
     * @type {DateTime} 
     */
    StartDate {
        get => this.get_StartDate()
    }

    /**
     * @type {DateTime} 
     */
    EndDate {
        get => this.get_EndDate()
    }

    /**
     * @type {TimeSpan} 
     */
    TrialTimeRemaining {
        get => this.get_TrialTimeRemaining()
    }

    /**
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
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
    get_CampaignId() {
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
    get_DeveloperOfferId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_AcquiredDate() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartDate() {
        value := DateTime()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_EndDate() {
        value := DateTime()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

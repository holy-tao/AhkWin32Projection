#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCEnumUserSearchResults.ahk
#Include .\IRTCCollection.ahk
#Include .\IRTCProfile2.ahk
#Include .\IRTCUserSearchQuery.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCUserSearchResultsEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCUserSearchResultsEvent
     * @type {Guid}
     */
    static IID => Guid("{d8c8c3cd-7fac-4088-81c5-c24cbc0938e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateResults", "get_Results", "get_Profile", "get_Query", "get_Cookie", "get_StatusCode", "get_MoreAvailable"]

    /**
     * @type {IRTCCollection} 
     */
    Results {
        get => this.get_Results()
    }

    /**
     * @type {IRTCProfile2} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {IRTCUserSearchQuery} 
     */
    Query {
        get => this.get_Query()
    }

    /**
     * @type {Pointer} 
     */
    Cookie {
        get => this.get_Cookie()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MoreAvailable {
        get => this.get_MoreAvailable()
    }

    /**
     * 
     * @returns {IRTCEnumUserSearchResults} 
     */
    EnumerateResults() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumUserSearchResults(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Results() {
        result := ComCall(8, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(9, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
    }

    /**
     * 
     * @returns {IRTCUserSearchQuery} 
     */
    get_Query() {
        result := ComCall(10, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IRTCUserSearchQuery(ppQuery)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Cookie() {
        result := ComCall(11, this, "ptr*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(12, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MoreAvailable() {
        result := ComCall(13, this, "short*", &pfMoreAvailable := 0, "HRESULT")
        return pfMoreAvailable
    }
}

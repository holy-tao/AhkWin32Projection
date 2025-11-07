#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCEnumBuddies.ahk
#Include .\IRTCCollection.ahk
#Include .\IRTCProfile2.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddyGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddyGroup
     * @type {Guid}
     */
    static IID => Guid("{60361e68-9164-4389-a4c6-d0b3925bda5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "AddBuddy", "RemoveBuddy", "EnumerateBuddies", "get_Buddies", "get_Data", "put_Data", "get_Profile"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrGroupName := BSTR()
        result := ComCall(3, this, "ptr", pbstrGroupName, "HRESULT")
        return pbstrGroupName
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_Name(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(4, this, "ptr", bstrGroupName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRTCBuddy} pBuddy 
     * @returns {HRESULT} 
     */
    AddBuddy(pBuddy) {
        result := ComCall(5, this, "ptr", pBuddy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRTCBuddy} pBuddy 
     * @returns {HRESULT} 
     */
    RemoveBuddy(pBuddy) {
        result := ComCall(6, this, "ptr", pBuddy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumBuddies} 
     */
    EnumerateBuddies() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumBuddies(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Buddies() {
        result := ComCall(8, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Data() {
        pbstrData := BSTR()
        result := ComCall(9, this, "ptr", pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @param {BSTR} bstrData 
     * @returns {HRESULT} 
     */
    put_Data(bstrData) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(10, this, "ptr", bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(11, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Describes user-defined events.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtseventinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMtsEventInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMtsEventInfo
     * @type {Guid}
     */
    static IID => Guid("{d56c3dc1-8482-11d0-b170-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Names", "get_DisplayName", "get_EventID", "get_Count", "get_Value"]

    /**
     * @type {IUnknown} 
     */
    Names {
        get => this.get_Names()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {BSTR} 
     */
    EventID {
        get => this.get_EventID()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Retrieves an enumerator for the names of the data values.
     * @returns {IUnknown} An interface pointer to the enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtseventinfo-get_names
     */
    get_Names() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Retrieves the display name of the object.
     * @returns {BSTR} The display name of the object.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtseventinfo-get_displayname
     */
    get_DisplayName() {
        sDisplayName := BSTR()
        result := ComCall(8, this, "ptr", sDisplayName, "HRESULT")
        return sDisplayName
    }

    /**
     * Retrieves the event identifier of the object.
     * @returns {BSTR} The event identifier of the object. This is a GUID converted to a string.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtseventinfo-get_eventid
     */
    get_EventID() {
        sGuidEventID := BSTR()
        result := ComCall(9, this, "ptr", sGuidEventID, "HRESULT")
        return sGuidEventID
    }

    /**
     * Retrieves the number of data values from the object.
     * @returns {Integer} The number of data values from the object.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtseventinfo-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &lCount := 0, "HRESULT")
        return lCount
    }

    /**
     * Retrieves the value of the specified user-defined event.
     * @param {BSTR} sKey The name or ordinal of the value.
     * @returns {VARIANT} The value of the user-defined event.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-imtseventinfo-get_value
     */
    get_Value(sKey) {
        sKey := sKey is String ? BSTR.Alloc(sKey).Value : sKey

        pVal := VARIANT()
        result := ComCall(11, this, "ptr", sKey, "ptr", pVal, "HRESULT")
        return pVal
    }
}

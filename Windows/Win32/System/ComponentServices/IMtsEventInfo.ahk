#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_names
     */
    get_Names(pUnk) {
        result := ComCall(7, this, "ptr*", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sDisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_displayname
     */
    get_DisplayName(sDisplayName) {
        result := ComCall(8, this, "ptr", sDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sGuidEventID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_eventid
     */
    get_EventID(sGuidEventID) {
        result := ComCall(9, this, "ptr", sGuidEventID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_count
     */
    get_Count(lCount) {
        result := ComCall(10, this, "int*", lCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} sKey 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtseventinfo-get_value
     */
    get_Value(sKey, pVal) {
        sKey := sKey is String ? BSTR.Alloc(sKey).Value : sKey

        result := ComCall(11, this, "ptr", sKey, "ptr", pVal, "HRESULT")
        return result
    }
}

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
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get_Names(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(sDisplayName) {
        result := ComCall(8, this, "ptr", sDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sGuidEventID 
     * @returns {HRESULT} 
     */
    get_EventID(sGuidEventID) {
        result := ComCall(9, this, "ptr", sGuidEventID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lCount 
     * @returns {HRESULT} 
     */
    get_Count(lCount) {
        result := ComCall(10, this, "int*", lCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} sKey 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Value(sKey, pVal) {
        sKey := sKey is String ? BSTR.Alloc(sKey).Value : sKey

        result := ComCall(11, this, "ptr", sKey, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Acts as a container for the entire set of named qualifiers for a single property or entire object (a class or instance).
 * @remarks
 * 
  * It is strongly recommended that Windows Management dynamic providers never implement this interface because  WMI provides the implementation. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a>.
  * 
  * Within WMI, this interface is always in-process. Put operations only affect the local copy of the object. Get operations retrieve values from the local copy. Updates are performed only when entire objects are read or written using methods on the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemqualifierset
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemQualifierSet extends IUnknown{
    /**
     * The interface identifier for IWbemQualifierSet
     * @type {Guid}
     */
    static IID => Guid("{dc12a680-737f-11cf-884d-00aa004b2e24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Int32>} plFlavor 
     * @returns {HRESULT} 
     */
    Get(wszName, lFlags, pVal, plFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(3, this, "ptr", wszName, "int", lFlags, "ptr", pVal, "int*", plFlavor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Integer} lFlavor 
     * @returns {HRESULT} 
     */
    Put(wszName, pVal, lFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(4, this, "ptr", wszName, "ptr", pVal, "int", lFlavor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     */
    Delete(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<SAFEARRAY>} pNames 
     * @returns {HRESULT} 
     */
    GetNames(lFlags, pNames) {
        result := ComCall(6, this, "int", lFlags, "ptr", pNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    BeginEnumeration(lFlags) {
        result := ComCall(7, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Int32>} plFlavor 
     * @returns {HRESULT} 
     */
    Next(lFlags, pstrName, pVal, plFlavor) {
        result := ComCall(8, this, "int", lFlags, "ptr", pstrName, "ptr", pVal, "int*", plFlavor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndEnumeration() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

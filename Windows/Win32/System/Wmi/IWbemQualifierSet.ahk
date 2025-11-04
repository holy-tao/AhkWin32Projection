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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Get", "Put", "Delete", "GetNames", "BeginEnumeration", "Next", "EndEnumeration"]

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Integer>} plFlavor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-get
     */
    Get(wszName, lFlags, pVal, plFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", wszName, "int", lFlags, "ptr", pVal, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Integer} lFlavor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-put
     */
    Put(wszName, pVal, lFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(4, this, "ptr", wszName, "ptr", pVal, "int", lFlavor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-delete
     */
    Delete(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Pointer<SAFEARRAY>>} pNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-getnames
     */
    GetNames(lFlags, pNames) {
        pNamesMarshal := pNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "int", lFlags, pNamesMarshal, pNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-beginenumeration
     */
    BeginEnumeration(lFlags) {
        result := ComCall(7, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Integer>} plFlavor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-next
     */
    Next(lFlags, pstrName, pVal, plFlavor) {
        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", lFlags, "ptr", pstrName, "ptr", pVal, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemqualifierset-endenumeration
     */
    EndEnumeration() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}

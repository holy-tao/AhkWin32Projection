#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Contains and manipulates both class definitions and class object instances.
 * @remarks
 * 
  * Users and providers should never implement this interface. The implementation provided by WMI is the only one 
  *      that is supported.
  * 
  * From the WMI client perspective, this interface is always in-process. Write 
  *      (<a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-put">Put</a>) operations only affect the local copy of the 
  *      object, and read (<a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-get">Get</a>) operations always retrieve 
  *      values from the local copy. You can perform updates to WMI only when entire objects are read or written using 
  *      methods on the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface. Examples of such 
  *      updates are: <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a> or 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">IWbemServices::PutClass</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemclassobject
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemClassObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemClassObject
     * @type {Guid}
     */
    static IID => Guid("{dc12a681-737f-11cf-884d-00aa004b2e24}")

    /**
     * The class identifier for WbemClassObject
     * @type {Guid}
     */
    static CLSID => Guid("{9a653086-174f-11d2-b5f9-00104b703efd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetQualifierSet", "Get", "Put", "Delete", "GetNames", "BeginEnumeration", "Next", "EndEnumeration", "GetPropertyQualifierSet", "Clone", "GetObjectText", "SpawnDerivedClass", "SpawnInstance", "CompareTo", "GetPropertyOrigin", "InheritsFrom", "GetMethod", "PutMethod", "DeleteMethod", "BeginMethodEnumeration", "NextMethod", "EndMethodEnumeration", "GetMethodQualifierSet", "GetMethodOrigin"]

    /**
     * 
     * @param {Pointer<IWbemQualifierSet>} ppQualSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getqualifierset
     */
    GetQualifierSet(ppQualSet) {
        result := ComCall(3, this, "ptr*", ppQualSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} plFlavor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-get
     */
    Get(wszName, lFlags, pVal, pType, plFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", wszName, "int", lFlags, "ptr", pVal, pTypeMarshal, pType, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-put
     */
    Put(wszName, lFlags, pVal, Type) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "int", lFlags, "ptr", pVal, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-delete
     */
    Delete(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(6, this, "ptr", wszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszQualifierName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pQualifierVal 
     * @param {Pointer<Pointer<SAFEARRAY>>} pNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getnames
     */
    GetNames(wszQualifierName, lFlags, pQualifierVal, pNames) {
        wszQualifierName := wszQualifierName is String ? StrPtr(wszQualifierName) : wszQualifierName

        result := ComCall(7, this, "ptr", wszQualifierName, "int", lFlags, "ptr", pQualifierVal, "ptr*", pNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEnumFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-beginenumeration
     */
    BeginEnumeration(lEnumFlags) {
        result := ComCall(8, this, "int", lEnumFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} plFlavor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-next
     */
    Next(lFlags, strName, pVal, pType, plFlavor) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        plFlavorMarshal := plFlavor is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", lFlags, "ptr", strName, "ptr", pVal, pTypeMarshal, pType, plFlavorMarshal, plFlavor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-endenumeration
     */
    EndEnumeration() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszProperty 
     * @param {Pointer<IWbemQualifierSet>} ppQualSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getpropertyqualifierset
     */
    GetPropertyQualifierSet(wszProperty, ppQualSet) {
        wszProperty := wszProperty is String ? StrPtr(wszProperty) : wszProperty

        result := ComCall(11, this, "ptr", wszProperty, "ptr*", ppQualSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} ppCopy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-clone
     */
    Clone(ppCopy) {
        result := ComCall(12, this, "ptr*", ppCopy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrObjectText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getobjecttext
     */
    GetObjectText(lFlags, pstrObjectText) {
        result := ComCall(13, this, "int", lFlags, "ptr", pstrObjectText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} ppNewClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-spawnderivedclass
     */
    SpawnDerivedClass(lFlags, ppNewClass) {
        result := ComCall(14, this, "int", lFlags, "ptr*", ppNewClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} ppNewInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-spawninstance
     */
    SpawnInstance(lFlags, ppNewInstance) {
        result := ComCall(15, this, "int", lFlags, "ptr*", ppNewInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWbemClassObject} pCompareTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-compareto
     */
    CompareTo(lFlags, pCompareTo) {
        result := ComCall(16, this, "int", lFlags, "ptr", pCompareTo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Pointer<BSTR>} pstrClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getpropertyorigin
     */
    GetPropertyOrigin(wszName, pstrClassName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(17, this, "ptr", wszName, "ptr", pstrClassName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} strAncestor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-inheritsfrom
     */
    InheritsFrom(strAncestor) {
        strAncestor := strAncestor is String ? StrPtr(strAncestor) : strAncestor

        result := ComCall(18, this, "ptr", strAncestor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} ppInSignature 
     * @param {Pointer<IWbemClassObject>} ppOutSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getmethod
     */
    GetMethod(wszName, lFlags, ppInSignature, ppOutSignature) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(19, this, "ptr", wszName, "int", lFlags, "ptr*", ppInSignature, "ptr*", ppOutSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {IWbemClassObject} pInSignature 
     * @param {IWbemClassObject} pOutSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-putmethod
     */
    PutMethod(wszName, lFlags, pInSignature, pOutSignature) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(20, this, "ptr", wszName, "int", lFlags, "ptr", pInSignature, "ptr", pOutSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-deletemethod
     */
    DeleteMethod(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(21, this, "ptr", wszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEnumFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-beginmethodenumeration
     */
    BeginMethodEnumeration(lEnumFlags) {
        result := ComCall(22, this, "int", lEnumFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<IWbemClassObject>} ppInSignature 
     * @param {Pointer<IWbemClassObject>} ppOutSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-nextmethod
     */
    NextMethod(lFlags, pstrName, ppInSignature, ppOutSignature) {
        result := ComCall(23, this, "int", lFlags, "ptr", pstrName, "ptr*", ppInSignature, "ptr*", ppOutSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-endmethodenumeration
     */
    EndMethodEnumeration() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMethod 
     * @param {Pointer<IWbemQualifierSet>} ppQualSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getmethodqualifierset
     */
    GetMethodQualifierSet(wszMethod, ppQualSet) {
        wszMethod := wszMethod is String ? StrPtr(wszMethod) : wszMethod

        result := ComCall(25, this, "ptr", wszMethod, "ptr*", ppQualSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMethodName 
     * @param {Pointer<BSTR>} pstrClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemclassobject-getmethodorigin
     */
    GetMethodOrigin(wszMethodName, pstrClassName) {
        wszMethodName := wszMethodName is String ? StrPtr(wszMethodName) : wszMethodName

        result := ComCall(26, this, "ptr", wszMethodName, "ptr", pstrClassName, "HRESULT")
        return result
    }
}

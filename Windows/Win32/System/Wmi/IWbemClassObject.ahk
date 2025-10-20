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
     * 
     * @param {Pointer<IWbemQualifierSet>} ppQualSet 
     * @returns {HRESULT} 
     */
    GetQualifierSet(ppQualSet) {
        result := ComCall(3, this, "ptr", ppQualSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Int32>} plFlavor 
     * @returns {HRESULT} 
     */
    Get(wszName, lFlags, pVal, pType, plFlavor) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(4, this, "ptr", wszName, "int", lFlags, "ptr", pVal, "int*", pType, "int*", plFlavor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    Put(wszName, lFlags, pVal, Type) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "int", lFlags, "ptr", pVal, "int", Type, "int")
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

        result := ComCall(6, this, "ptr", wszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszQualifierName 
     * @param {Integer} lFlags 
     * @param {Pointer<VARIANT>} pQualifierVal 
     * @param {Pointer<SAFEARRAY>} pNames 
     * @returns {HRESULT} 
     */
    GetNames(wszQualifierName, lFlags, pQualifierVal, pNames) {
        wszQualifierName := wszQualifierName is String ? StrPtr(wszQualifierName) : wszQualifierName

        result := ComCall(7, this, "ptr", wszQualifierName, "int", lFlags, "ptr", pQualifierVal, "ptr", pNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEnumFlags 
     * @returns {HRESULT} 
     */
    BeginEnumeration(lEnumFlags) {
        result := ComCall(8, this, "int", lEnumFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<VARIANT>} pVal 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Int32>} plFlavor 
     * @returns {HRESULT} 
     */
    Next(lFlags, strName, pVal, pType, plFlavor) {
        result := ComCall(9, this, "int", lFlags, "ptr", strName, "ptr", pVal, "int*", pType, "int*", plFlavor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndEnumeration() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszProperty 
     * @param {Pointer<IWbemQualifierSet>} ppQualSet 
     * @returns {HRESULT} 
     */
    GetPropertyQualifierSet(wszProperty, ppQualSet) {
        wszProperty := wszProperty is String ? StrPtr(wszProperty) : wszProperty

        result := ComCall(11, this, "ptr", wszProperty, "ptr", ppQualSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} ppCopy 
     * @returns {HRESULT} 
     */
    Clone(ppCopy) {
        result := ComCall(12, this, "ptr", ppCopy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrObjectText 
     * @returns {HRESULT} 
     */
    GetObjectText(lFlags, pstrObjectText) {
        result := ComCall(13, this, "int", lFlags, "ptr", pstrObjectText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} ppNewClass 
     * @returns {HRESULT} 
     */
    SpawnDerivedClass(lFlags, ppNewClass) {
        result := ComCall(14, this, "int", lFlags, "ptr", ppNewClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} ppNewInstance 
     * @returns {HRESULT} 
     */
    SpawnInstance(lFlags, ppNewInstance) {
        result := ComCall(15, this, "int", lFlags, "ptr", ppNewInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} pCompareTo 
     * @returns {HRESULT} 
     */
    CompareTo(lFlags, pCompareTo) {
        result := ComCall(16, this, "int", lFlags, "ptr", pCompareTo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Pointer<BSTR>} pstrClassName 
     * @returns {HRESULT} 
     */
    GetPropertyOrigin(wszName, pstrClassName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(17, this, "ptr", wszName, "ptr", pstrClassName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} strAncestor 
     * @returns {HRESULT} 
     */
    InheritsFrom(strAncestor) {
        strAncestor := strAncestor is String ? StrPtr(strAncestor) : strAncestor

        result := ComCall(18, this, "ptr", strAncestor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} ppInSignature 
     * @param {Pointer<IWbemClassObject>} ppOutSignature 
     * @returns {HRESULT} 
     */
    GetMethod(wszName, lFlags, ppInSignature, ppOutSignature) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(19, this, "ptr", wszName, "int", lFlags, "ptr", ppInSignature, "ptr", ppOutSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemClassObject>} pInSignature 
     * @param {Pointer<IWbemClassObject>} pOutSignature 
     * @returns {HRESULT} 
     */
    PutMethod(wszName, lFlags, pInSignature, pOutSignature) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(20, this, "ptr", wszName, "int", lFlags, "ptr", pInSignature, "ptr", pOutSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     */
    DeleteMethod(wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(21, this, "ptr", wszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEnumFlags 
     * @returns {HRESULT} 
     */
    BeginMethodEnumeration(lEnumFlags) {
        result := ComCall(22, this, "int", lEnumFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<BSTR>} pstrName 
     * @param {Pointer<IWbemClassObject>} ppInSignature 
     * @param {Pointer<IWbemClassObject>} ppOutSignature 
     * @returns {HRESULT} 
     */
    NextMethod(lFlags, pstrName, ppInSignature, ppOutSignature) {
        result := ComCall(23, this, "int", lFlags, "ptr", pstrName, "ptr", ppInSignature, "ptr", ppOutSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndMethodEnumeration() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszMethod 
     * @param {Pointer<IWbemQualifierSet>} ppQualSet 
     * @returns {HRESULT} 
     */
    GetMethodQualifierSet(wszMethod, ppQualSet) {
        wszMethod := wszMethod is String ? StrPtr(wszMethod) : wszMethod

        result := ComCall(25, this, "ptr", wszMethod, "ptr", ppQualSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszMethodName 
     * @param {Pointer<BSTR>} pstrClassName 
     * @returns {HRESULT} 
     */
    GetMethodOrigin(wszMethodName, pstrClassName) {
        wszMethodName := wszMethodName is String ? StrPtr(wszMethodName) : wszMethodName

        result := ComCall(26, this, "ptr", wszMethodName, "ptr", pstrClassName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used in refresher operations to provide rapid access to enumerations of instance objects.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemhiperfenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemHiPerfEnum extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemHiPerfEnum
     * @type {Guid}
     */
    static IID => Guid("{2705c288-79ae-11d2-b348-00105a1f8177}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddObjects", "RemoveObjects", "GetObjects", "RemoveAll"]

    /**
     * The IWbemHiPerfEnum::AddObjects method adds the supplied instance objects to the enumerator.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {Integer} uNumObjects Number of items in the object and the number of identifiers in the parameter.
     * @param {Pointer<Integer>} apIds Pointer to an array of integers that contains a unique identifier for each object in the object array.
     * @param {Pointer<IWbemObjectAccess>} apObj Pointer to an array of instance objects to add to the enumerator.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemhiperfenum-addobjects
     */
    AddObjects(lFlags, uNumObjects, apIds, apObj) {
        apIdsMarshal := apIds is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", lFlags, "uint", uNumObjects, apIdsMarshal, apIds, "ptr*", apObj, "HRESULT")
        return result
    }

    /**
     * The IWbemHiPerfEnum::RemoveObjects method removes objects (identified by their refresher identifiers) from a refresher.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Integer} uNumObjects Number of objects to remove.
     * @param {Pointer<Integer>} apIds Pointer to an array of integers that contains the refresher identifiers of the objects to remove.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemhiperfenum-removeobjects
     */
    RemoveObjects(lFlags, uNumObjects, apIds) {
        apIdsMarshal := apIds is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", lFlags, "uint", uNumObjects, apIdsMarshal, apIds, "HRESULT")
        return result
    }

    /**
     * The IWbemHiPerfEnum::GetObjects method retrieves objects currently residing in the enumerator.
     * @param {Integer} lFlags Integer that contains the flags.
     * @param {Integer} uNumObjects Size of the array passed to this method in the <i>apObj</i> parameter.
     * @param {Pointer<IWbemObjectAccess>} apObj Pointer that holds the reference to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemobjectaccess">IWbemObjectAccess</a> objects, which contains the returned objects. The array must be big enough to hold all objects in the enumerator.
     * @param {Pointer<Integer>} puReturned Pointer to a <b>ULONG</b> used to return the number of objects placed in the array.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemhiperfenum-getobjects
     */
    GetObjects(lFlags, uNumObjects, apObj, puReturned) {
        puReturnedMarshal := puReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", lFlags, "uint", uNumObjects, "ptr*", apObj, puReturnedMarshal, puReturned, "HRESULT")
        return result
    }

    /**
     * The IWbemHiPerfEnum::RemoveAll method empties all objects from the enumerator.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemhiperfenum-removeall
     */
    RemoveAll(lFlags) {
        result := ComCall(6, this, "int", lFlags, "HRESULT")
        return result
    }
}

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
     * 
     * @param {Integer} lFlags 
     * @param {Integer} uNumObjects 
     * @param {Pointer<Integer>} apIds 
     * @param {Pointer<IWbemObjectAccess>} apObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemhiperfenum-addobjects
     */
    AddObjects(lFlags, uNumObjects, apIds, apObj) {
        apIdsMarshal := apIds is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", lFlags, "uint", uNumObjects, apIdsMarshal, apIds, "ptr*", apObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Integer} uNumObjects 
     * @param {Pointer<Integer>} apIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemhiperfenum-removeobjects
     */
    RemoveObjects(lFlags, uNumObjects, apIds) {
        apIdsMarshal := apIds is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", lFlags, "uint", uNumObjects, apIdsMarshal, apIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Integer} uNumObjects 
     * @param {Pointer<IWbemObjectAccess>} apObj 
     * @param {Pointer<Integer>} puReturned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemhiperfenum-getobjects
     */
    GetObjects(lFlags, uNumObjects, apObj, puReturned) {
        puReturnedMarshal := puReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", lFlags, "uint", uNumObjects, "ptr*", apObj, puReturnedMarshal, puReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemhiperfenum-removeall
     */
    RemoveAll(lFlags) {
        result := ComCall(6, this, "int", lFlags, "HRESULT")
        return result
    }
}

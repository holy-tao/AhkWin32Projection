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
     * 
     * @param {Integer} lFlags 
     * @param {Integer} uNumObjects 
     * @param {Pointer<Int32>} apIds 
     * @param {Pointer<IWbemObjectAccess>} apObj 
     * @returns {HRESULT} 
     */
    AddObjects(lFlags, uNumObjects, apIds, apObj) {
        result := ComCall(3, this, "int", lFlags, "uint", uNumObjects, "int*", apIds, "ptr", apObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Integer} uNumObjects 
     * @param {Pointer<Int32>} apIds 
     * @returns {HRESULT} 
     */
    RemoveObjects(lFlags, uNumObjects, apIds) {
        result := ComCall(4, this, "int", lFlags, "uint", uNumObjects, "int*", apIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Integer} uNumObjects 
     * @param {Pointer<IWbemObjectAccess>} apObj 
     * @param {Pointer<UInt32>} puReturned 
     * @returns {HRESULT} 
     */
    GetObjects(lFlags, uNumObjects, apObj, puReturned) {
        result := ComCall(5, this, "int", lFlags, "uint", uNumObjects, "ptr", apObj, "uint*", puReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    RemoveAll(lFlags) {
        result := ComCall(6, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

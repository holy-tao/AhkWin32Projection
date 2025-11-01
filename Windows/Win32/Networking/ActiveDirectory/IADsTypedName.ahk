#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsTypedName interface provides methods for an ADSI client to access the Typed Name attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadstypedname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsTypedName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsTypedName
     * @type {Guid}
     */
    static IID => Guid("{b371a349-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ObjectName", "put_ObjectName", "get_Level", "put_Level", "get_Interval", "put_Interval"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ObjectName(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        result := ComCall(8, this, "ptr", bstrObjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Level(retval) {
        result := ComCall(9, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnLevel 
     * @returns {HRESULT} 
     */
    put_Level(lnLevel) {
        result := ComCall(10, this, "int", lnLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Interval(retval) {
        result := ComCall(11, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnInterval 
     * @returns {HRESULT} 
     */
    put_Interval(lnInterval) {
        result := ComCall(12, this, "int", lnInterval, "HRESULT")
        return result
    }
}

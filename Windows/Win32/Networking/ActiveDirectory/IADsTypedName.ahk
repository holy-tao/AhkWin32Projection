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
     * @type {BSTR} 
     */
    ObjectName {
        get => this.get_ObjectName()
        set => this.put_ObjectName(value)
    }

    /**
     * @type {Integer} 
     */
    Level {
        get => this.get_Level()
        set => this.put_Level(value)
    }

    /**
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectName() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_Level() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_Interval() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
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

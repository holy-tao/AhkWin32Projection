#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPath interface provides methods for an ADSI client to access the Path attribute.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadspath
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPath extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPath
     * @type {Guid}
     */
    static IID => Guid("{b287fcd5-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_VolumeName", "put_VolumeName", "get_Path", "put_Path"]

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    VolumeName {
        get => this.get_VolumeName()
        set => this.put_VolumeName(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnType 
     * @returns {HRESULT} 
     */
    put_Type(lnType) {
        result := ComCall(8, this, "int", lnType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VolumeName() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrVolumeName 
     * @returns {HRESULT} 
     */
    put_VolumeName(bstrVolumeName) {
        if(bstrVolumeName is String) {
            pin := BSTR.Alloc(bstrVolumeName)
            bstrVolumeName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrVolumeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR()
        result := ComCall(11, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        if(bstrPath is String) {
            pin := BSTR.Alloc(bstrPath)
            bstrPath := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

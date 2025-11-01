#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPath interface provides methods for an ADSI client to access the Path attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspath
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
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Type(retval) {
        result := ComCall(7, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnType 
     * @returns {HRESULT} 
     */
    put_Type(lnType) {
        result := ComCall(8, this, "int", lnType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_VolumeName(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVolumeName 
     * @returns {HRESULT} 
     */
    put_VolumeName(bstrVolumeName) {
        bstrVolumeName := bstrVolumeName is String ? BSTR.Alloc(bstrVolumeName).Value : bstrVolumeName

        result := ComCall(10, this, "ptr", bstrVolumeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Path(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(12, this, "ptr", bstrPath, "HRESULT")
        return result
    }
}

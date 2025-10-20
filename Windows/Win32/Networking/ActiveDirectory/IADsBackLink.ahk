#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsBackLink interface provides methods for an ADSI client to access the Back Link attribute. You can call the property methods of this interface to obtain and modify the attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsbacklink
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsBackLink extends IDispatch{
    /**
     * The interface identifier for IADsBackLink
     * @type {Guid}
     */
    static IID => Guid("{fd1302bd-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_RemoteID(retval) {
        result := ComCall(7, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnRemoteID 
     * @returns {HRESULT} 
     */
    put_RemoteID(lnRemoteID) {
        result := ComCall(8, this, "int", lnRemoteID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ObjectName(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        result := ComCall(10, this, "ptr", bstrObjectName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk

/**
 * The IADsResource interface is a dual interface that inherits from IADs. It is designed to manage an open resource for a file service across a network.
 * @remarks
 * 
  * When a remote user opens a folder or a subfolder on a public share point on the target computer, ADSI considers this folder to be an open resource and represents it with a resource object that implements this interface.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsresource
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsResource extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsResource
     * @type {Guid}
     */
    static IID => Guid("{34a05b20-4aab-11cf-ae2c-00aa006ebfb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "get_UserPath", "get_Path", "get_LockCount"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_User(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_UserPath(retval) {
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Path(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_LockCount(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}

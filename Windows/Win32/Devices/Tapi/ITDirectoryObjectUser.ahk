#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectoryObjectUser interface is the common interface supported by the User object. This interface is created by calling QueryInterface on ITDirectoryObject.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-itdirectoryobjectuser
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectoryObjectUser extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDirectoryObjectUser
     * @type {Guid}
     */
    static IID => Guid("{34621d6f-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IPPhonePrimary", "put_IPPhonePrimary"]

    /**
     * @type {BSTR} 
     */
    IPPhonePrimary {
        get => this.get_IPPhonePrimary()
        set => this.put_IPPhonePrimary(value)
    }

    /**
     * The get_IPPhonePrimary method gets the name of a computer that is the primary IP phone for the user.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppName</i> parameter.
     * @returns {BSTR} Pointer to the <b>BSTR</b> representation of the user's IP primary phone.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectuser-get_ipphoneprimary
     */
    get_IPPhonePrimary() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The put_IPPhonePrimary method sets the name of a machine as the primary IP phone for a user.
     * @remarks
     * This method can be used only on a new object that is subsequently added to the directory. If an application wants to modify the IP phone of an existing user object, it has to enumerate the objects from the server to determine the old IP phones are. This implies that a TAPI 3 application is running on one or more other machines. The application on a local machine has no information about whether those other applications are still running. Therefore, it is not the application's place to change the IP Phone on existing user objects.
     * 
     * To modify an existing user's IP Phone, the user must be deleted and re-added.
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pName</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {BSTR} pName Pointer to the <b>BSTR</b> representation of the user's IP primary phone.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectuser-put_ipphoneprimary
     */
    put_IPPhonePrimary(pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(8, this, "ptr", pName, "HRESULT")
        return result
    }
}

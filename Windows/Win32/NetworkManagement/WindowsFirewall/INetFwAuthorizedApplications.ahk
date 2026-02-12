#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwAuthorizedApplication.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwAuthorizedApplications interface provides access to a collection of applications authorized open ports in the firewall.
 * @remarks
 * An instance of this interface is retrieved through the
 * <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_authorizedapplications">AuthorizedApplications</a> property of the INetFwProfile interface. 
 * 
 * All
 * configuration changes take effect immediately.
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nn-netfw-inetfwauthorizedapplications
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwAuthorizedApplications extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwAuthorizedApplications
     * @type {Guid}
     */
    static IID => Guid("{644efd52-ccf9-486c-97a2-39f352570b30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Add", "Remove", "Item", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Specifies the number of items in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwauthorizedapplications-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * The Add method adds a new application to the collection.
     * @remarks
     * If an application with the same path already exists, the existing settings are overwritten.
     * @param {INetFwAuthorizedApplication} app <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * Application to add to the collection via an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplication">INetFWAuthorizedApplication</a> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * Application to add to the collection via an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplication">INetFWAuthorizedApplication</a> object. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because a parameter was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  method failed because the  object is already in the collection.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because a parameter was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  method failed because the  object is already in the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwauthorizedapplications-add
     */
    Add(app) {
        result := ComCall(8, this, "ptr", app, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Remove method removes an application from the collection.
     * @remarks
     * The <b>imageFileName</b> parameter must be a fully qualified path and may contain environment variables.
     * 
     * If the application does not exist in the collection, the Remove method has no effect.
     * @param {BSTR} imageFileName Application name to be removed.
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwauthorizedapplications-remove
     */
    Remove(imageFileName) {
        if(imageFileName is String) {
            pin := BSTR.Alloc(imageFileName)
            imageFileName := pin.Value
        }

        result := ComCall(9, this, "ptr", imageFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Item method returns the specified application if it is in the collection.
     * @param {BSTR} imageFileName Application to retrieve.
     * @returns {INetFwAuthorizedApplication} Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwauthorizedapplication">INetFwAuthorizedApplication</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwauthorizedapplications-item
     */
    Item(imageFileName) {
        if(imageFileName is String) {
            pin := BSTR.Alloc(imageFileName)
            imageFileName := pin.Value
        }

        result := ComCall(10, this, "ptr", imageFileName, "ptr*", &app := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INetFwAuthorizedApplication(app)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the applications in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwauthorizedapplications-get__newenum
     */
    get__NewEnum() {
        result := ComCall(11, this, "ptr*", &newEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(newEnum)
    }
}

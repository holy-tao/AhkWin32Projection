#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssWMDependency is a C++ (not COM) interface returned by the IVssWMComponent interface and used by applications when backing up or restoring a component that has an explicit writer-component dependency on a component managed by another writer.
 * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nl-vswriter-ivsswmdependency
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssWMDependency extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWriterId", "GetLogicalPath", "GetComponentName"]

    /**
     * The GetWriterId method retrieves the class ID of a writer containing a component that the current component depends on in an explicit writer-component dependency.
     * @remarks
     * A dependency does not indicate an order of preference between the component with the documented dependencies and the components it depends on. A dependency merely indicates that the component and the components it depends on must always be backed up or restored together.
     * 
     * It is possible to have multiple instances of a given writer class; however, any component's logical path and name should be unique.
     * 
     * If there are multiple instances of a writer class, it will be necessary to use logical path and component name information to identify the instance managing the component that the current component depends on.
     * @param {Pointer<Guid>} pWriterId The class ID of a writer that manages a component on which the current component depends.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the class ID of the writer managing the component that the current component depends on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No writer can be found that manages the component that the current component depends on.
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
     * The pointer <i>pWriterId</i> points to unallocated memory.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsswmdependency-getwriterid
     */
    GetWriterId(pWriterId) {
        result := ComCall(3, this, "ptr", pWriterId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetLogicalPath method retrieves the logical path of a component that the current component depends on in explicit writer-component dependency.
     * @remarks
     * The caller must free the memory used by the returned string by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * 
     * A dependency does not indicate an order of preference between the component with the documented dependencies and the components it depends on. A dependency merely indicates that the component and the components it depends on must always be backed up or restored together.
     * 
     * It is possible to have multiple instances of a given writer class; however, any component's logical path and name should be unique.
     * 
     * If there are multiple instances of a writer class, it will be necessary to use logical path and component name information to identify the instance managing the component that the current component depends on.
     * @param {Pointer<BSTR>} pbstrLogicalPath The address of a caller-allocated variable that receives a <b>NULL</b>-terminated wide character string containing the logical path of the component that the current component depends on.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the logical path of the component that the current component depends on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No writer can be found that manages the component that the current component depends on.
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
     * The pointer <i>pbstrLogicalPath</i> points to unallocated memory.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsswmdependency-getlogicalpath
     */
    GetLogicalPath(pbstrLogicalPath) {
        result := ComCall(4, this, "ptr", pbstrLogicalPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetComponentName method retrieves the name of a component that the current component depends on in an explicit writer-component dependency.
     * @remarks
     * The caller must free the memory used by the returned string by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * 
     * A dependency does not indicate an order of preference between the component with the documented dependencies and the components it depends on. A dependency merely indicates that the component and the components it depends on must always be backed up or restored together.
     * 
     * It is possible to have multiple instances of a given writer class; however, any component's logical path and name should be unique.
     * 
     * If there are multiple instances of a writer class, it will be necessary to use logical path and component name information to identify the instance managing the component that the current component depends on.
     * @param {Pointer<BSTR>} pbstrComponentName The address of a caller-allocated variable that receives a <b>NULL</b>-terminated wide character string containing the name of the component that the current component depends on.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the name of the component that the current component depends on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No writer can be found that manages the component that the current component depends on.
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
     * The pointer <i>pbstrComponentName</i> points to unallocated memory.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vswriter/nf-vswriter-ivsswmdependency-getcomponentname
     */
    GetComponentName(pbstrComponentName) {
        result := ComCall(5, this, "ptr", pbstrComponentName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

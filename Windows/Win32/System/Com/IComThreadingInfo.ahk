#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables you to obtain the following information about the apartment and thread that the caller is executing in:\_apartment type, thread type, and thread GUID. It also allows you to specify a thread GUID.
 * @remarks
 * 
 *  An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-icomthreadinginfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IComThreadingInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComThreadingInfo
     * @type {Guid}
     */
    static IID => Guid("{000001ce-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentApartmentType", "GetCurrentThreadType", "GetCurrentLogicalThreadId", "SetCurrentLogicalThreadId"]

    /**
     * Retrieves the type of apartment in which the caller is executing.
     * @returns {Integer} A points to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-apttype">APTTYPE</a> enumeration value that characterizes the caller's apartment.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-icomthreadinginfo-getcurrentapartmenttype
     */
    GetCurrentApartmentType() {
        result := ComCall(3, this, "int*", &pAptType := 0, "HRESULT")
        return pAptType
    }

    /**
     * Retrieves the type of thread in which the caller is executing.
     * @returns {Integer} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-thdtype">THDTYPE</a> enumeration value that characterizes the caller's thread.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-icomthreadinginfo-getcurrentthreadtype
     */
    GetCurrentThreadType() {
        result := ComCall(4, this, "int*", &pThreadType := 0, "HRESULT")
        return pThreadType
    }

    /**
     * Retrieves the GUID of the thread in which the caller is executing.
     * @returns {Guid} A pointer to the GUID of the caller's thread.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-icomthreadinginfo-getcurrentlogicalthreadid
     */
    GetCurrentLogicalThreadId() {
        pguidLogicalThreadId := Guid()
        result := ComCall(5, this, "ptr", pguidLogicalThreadId, "HRESULT")
        return pguidLogicalThreadId
    }

    /**
     * Sets the GUID of the thread in which the caller is executing.
     * @param {Pointer<Guid>} rguid A reference to a GUID for the caller's thread.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not executing in an apartment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-icomthreadinginfo-setcurrentlogicalthreadid
     */
    SetCurrentLogicalThreadId(rguid) {
        result := ComCall(6, this, "ptr", rguid, "HRESULT")
        return result
    }
}

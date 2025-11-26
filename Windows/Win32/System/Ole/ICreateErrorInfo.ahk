#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Returns error information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreateerrorinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{22f03340-547d-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGUID", "SetSource", "SetDescription", "SetHelpFile", "SetHelpContext"]

    /**
     * Sets the globally unique identifier (GUID) of the interface that defined the error.
     * @param {Pointer<Guid>} rguid The GUID of the interface that defined the error, or GUID_NULL if the error was defined by the operating system.
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
     * Success.
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
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-icreateerrorinfo-setguid
     */
    SetGUID(rguid) {
        result := ComCall(3, this, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * Sets the language-dependent programmatic identifier (ProgID) for the class or application that raised the error.
     * @param {PWSTR} szSource A ProgID in the form <i>progname</i>.<i>objectname</i>.
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
     * Success.
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
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-icreateerrorinfo-setsource
     */
    SetSource(szSource) {
        szSource := szSource is String ? StrPtr(szSource) : szSource

        result := ComCall(4, this, "ptr", szSource, "HRESULT")
        return result
    }

    /**
     * Sets the textual description of the error.
     * @param {PWSTR} szDescription A brief description of the error.
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
     * Success.
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
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-icreateerrorinfo-setdescription
     */
    SetDescription(szDescription) {
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(5, this, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * Sets the path of the Help file that describes the error.
     * @param {PWSTR} szHelpFile The fully qualified path of the Help file that describes the error.
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
     * Success.
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
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-icreateerrorinfo-sethelpfile
     */
    SetHelpFile(szHelpFile) {
        szHelpFile := szHelpFile is String ? StrPtr(szHelpFile) : szHelpFile

        result := ComCall(6, this, "ptr", szHelpFile, "HRESULT")
        return result
    }

    /**
     * Sets the Help context identifier (ID) for the error.
     * @param {Integer} dwHelpContext The Help context ID for the error.
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
     * Success.
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
     * Insufficient memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-icreateerrorinfo-sethelpcontext
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(7, this, "uint", dwHelpContext, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmDependency interface retrieves details for a single module dependency.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmdependency
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmDependency extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMsmDependency
     * @type {Guid}
     */
    static IID => Guid("{0adda82b-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Module", "get_Language", "get_Version"]

    /**
     */
    Module {
        get => this.get_Module()
    }

    /**
     */
    Language {
        get => this.get_Language()
    }

    /**
     */
    Version {
        get => this.get_Version()
    }

    /**
     * The get_Module method retrieves the Module property of the Dependency object. This method returns the ModuleID of the module required by the current string in the form of a BSTR. The ModuleID is of the same form as used in the ModuleSignature table.
     * @param {Pointer<BSTR>} Module A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Module is null
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmdependency-get_module
     */
    get_Module(Module) {
        result := ComCall(7, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * The get_Language method retrieves the Language property of the Dependency object. This method returns the LANGID of the required module.
     * @param {Pointer<Integer>} Language A pointer to a location in memory that receives the language.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Language is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmdependency-get_language
     */
    get_Language(Language) {
        LanguageMarshal := Language is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, LanguageMarshal, Language, "HRESULT")
        return result
    }

    /**
     * The get_Version method retrieves the Version property of the Dependency object. This method returns the version of the required module in the form of a BSTR.
     * @param {Pointer<BSTR>} Version A pointer to a location in memory that is filled in with a <b>BSTR</b> value.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mergemod/nf-mergemod-imsmdependency-get_version
     */
    get_Version(Version) {
        result := ComCall(9, this, "ptr", Version, "HRESULT")
        return result
    }
}

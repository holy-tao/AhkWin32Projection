#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-ichecksxsconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICheckSxsConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICheckSxsConfig
     * @type {Guid}
     */
    static IID => Guid("{0ff5a96f-11fc-47d1-baa6-25dd347e7242}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSameSxsConfig"]

    /**
     * Determines whether the side-by-side assembly has the specified configuration.
     * @param {PWSTR} wszSxsName A text string that contains the file name of the side-by-side assembly. The proper extension is added automatically.
     * @param {PWSTR} wszSxsDirectory A text string that contains the directory of the side-by-side assembly.
     * @param {PWSTR} wszSxsAppName A text string that contains the name of the application domain.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
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
     * The current side-by-side assembly has the specified configuration.
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
     * The current side-by-side assembly does not have the specified configuration.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-ichecksxsconfig-issamesxsconfig
     */
    IsSameSxsConfig(wszSxsName, wszSxsDirectory, wszSxsAppName) {
        wszSxsName := wszSxsName is String ? StrPtr(wszSxsName) : wszSxsName
        wszSxsDirectory := wszSxsDirectory is String ? StrPtr(wszSxsDirectory) : wszSxsDirectory
        wszSxsAppName := wszSxsAppName is String ? StrPtr(wszSxsAppName) : wszSxsAppName

        result := ComCall(3, this, "ptr", wszSxsName, "ptr", wszSxsDirectory, "ptr", wszSxsAppName, "HRESULT")
        return result
    }
}

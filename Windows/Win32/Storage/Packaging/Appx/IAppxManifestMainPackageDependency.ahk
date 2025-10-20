#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the main package dependency.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestmainpackagedependency
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestMainPackageDependency extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestMainPackageDependency
     * @type {Guid}
     */
    static IID => Guid("{05d0611c-bc29-46d5-97e2-84b9c79bd8ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetPublisher", "GetPackageFamilyName"]

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getname
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} publisher 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestmainpackagedependency-getpublisher
     */
    GetPublisher(publisher) {
        result := ComCall(4, this, "ptr", publisher, "HRESULT")
        return result
    }

    /**
     * Gets the package family name for the specified process.
     * @param {Pointer<PWSTR>} packageFamilyName Type: <b>PWSTR</b>
     * 
     * The package family name.
     * @returns {HRESULT} Type: <b>LONG</b>
     * 
     * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process has no package identity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFamilyNameLength</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackagefamilyname
     */
    GetPackageFamilyName(packageFamilyName) {
        result := ComCall(5, this, "ptr", packageFamilyName, "HRESULT")
        return result
    }
}

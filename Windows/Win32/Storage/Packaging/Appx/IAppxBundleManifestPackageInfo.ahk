#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for a &lt;Package&gt; element in a bundle package manifest.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestpackageinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo
     * @type {Guid}
     */
    static IID => Guid("{54cd06c1-268f-40bb-8ed2-757a9ebaec8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageType", "GetPackageId", "GetFileName", "GetOffset", "GetSize", "GetResources"]

    /**
     * 
     * @param {Pointer<Integer>} packageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getpackagetype
     */
    GetPackageType(packageType) {
        result := ComCall(3, this, "int*", packageType, "HRESULT")
        return result
    }

    /**
     * Gets the package identifier (ID) for the specified process.
     * @param {Pointer<IAppxManifestPackageId>} packageId 
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
     * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackageid
     */
    GetPackageId(packageId) {
        result := ComCall(4, this, "ptr*", packageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} fileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getfilename
     */
    GetFileName(fileName) {
        result := ComCall(5, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getoffset
     */
    GetOffset(offset) {
        result := ComCall(6, this, "uint*", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getsize
     */
    GetSize(size) {
        result := ComCall(7, this, "uint*", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestQualifiedResourcesEnumerator>} resources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestpackageinfo-getresources
     */
    GetResources(resources) {
        result := ComCall(8, this, "ptr*", resources, "HRESULT")
        return result
    }
}

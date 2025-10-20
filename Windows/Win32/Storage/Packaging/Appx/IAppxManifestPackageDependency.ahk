#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Describes the dependency of one package on another package.
 * @remarks
 * 
  * A dependency package is a package that the current package depends on, as specified in the package manifest using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-packagedependency">PackageDependency</a> element.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestpackagedependency
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestPackageDependency extends IUnknown{
    /**
     * The interface identifier for IAppxManifestPackageDependency
     * @type {Guid}
     */
    static IID => Guid("{e4946b59-733e-43f0-a724-3bde4c1285a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} publisher 
     * @returns {HRESULT} 
     */
    GetPublisher(publisher) {
        result := ComCall(4, this, "ptr", publisher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} minVersion 
     * @returns {HRESULT} 
     */
    GetMinVersion(minVersion) {
        result := ComCall(5, this, "uint*", minVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

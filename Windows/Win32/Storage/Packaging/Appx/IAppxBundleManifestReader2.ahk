#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for manifests of bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlemanifestreader2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestReader2 extends IUnknown{
    /**
     * The interface identifier for IAppxBundleManifestReader2
     * @type {Guid}
     */
    static IID => Guid("{5517df70-033f-4af2-8213-87d766805c02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAppxBundleManifestOptionalBundleInfoEnumerator>} optionalBundles 
     * @returns {HRESULT} 
     */
    GetOptionalBundles(optionalBundles) {
        result := ComCall(3, this, "ptr", optionalBundles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

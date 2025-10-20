#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestPackageDependency.ahk

/**
 * Describes the dependency of one package on another package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestpackagedependency2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestPackageDependency2 extends IAppxManifestPackageDependency{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestPackageDependency2
     * @type {Guid}
     */
    static IID => Guid("{dda0b713-f3ff-49d3-898a-2786780c5d98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxMajorVersionTested"]

    /**
     * 
     * @param {Pointer<Integer>} maxMajorVersionTested 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackagedependency2-getmaxmajorversiontested
     */
    GetMaxMajorVersionTested(maxMajorVersionTested) {
        result := ComCall(6, this, "ushort*", maxMajorVersionTested, "HRESULT")
        return result
    }
}

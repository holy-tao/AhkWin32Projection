#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestReader3.ahk
#Include .\IAppxManifestOptionalPackageInfo.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class IAppxManifestReader4 extends IAppxManifestReader3 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestReader4
     * @type {Guid}
     */
    static IID => Guid("{4579bb7c-741d-4161-b5a1-47bd3b78ad9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptionalPackageInfo"]

    /**
     * 
     * @returns {IAppxManifestOptionalPackageInfo} 
     */
    GetOptionalPackageInfo() {
        result := ComCall(15, this, "ptr*", &optionalPackageInfo := 0, "HRESULT")
        return IAppxManifestOptionalPackageInfo(optionalPackageInfo)
    }
}

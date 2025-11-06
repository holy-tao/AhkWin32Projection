#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestPackageId.ahk

/**
 * Provides access to the app package identity.
 * @remarks
 * 
  * Package identity information is specified using the <b>Identity</b> element in the package manifest.
  * 
  * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid">IAppxManifestReader::GetPackageId</a> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestpackageid2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestPackageId2 extends IAppxManifestPackageId{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestPackageId2
     * @type {Guid}
     */
    static IID => Guid("{2256999d-d617-42f1-880e-0ba4542319d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetArchitecture2"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid2-getarchitecture2
     */
    GetArchitecture2() {
        result := ComCall(11, this, "int*", &architecture := 0, "HRESULT")
        return architecture
    }
}

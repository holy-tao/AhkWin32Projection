#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestReader.ahk

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Starting with Windows 8.1, we recommend not to use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources">IAppxManifestReader::GetResources</a> anymore to only iterate over the <b>Language</b> values in the manifest. Instead, use <b>IAppxManifestReader2::GetResources</b> because it iterates over other resource qualifiers as well, such as, <b>Scale</b> and <b>DXFeatureLevel</b>. </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestreader2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader2 extends IAppxManifestReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestReader2
     * @type {Guid}
     */
    static IID => Guid("{d06f67bc-b31d-4eba-a8af-638e73e77b4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetQualifiedResources"]

    /**
     * 
     * @param {Pointer<IAppxManifestQualifiedResourcesEnumerator>} resources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader2-getqualifiedresources
     */
    GetQualifiedResources(resources) {
        result := ComCall(12, this, "ptr*", resources, "HRESULT")
        return result
    }
}

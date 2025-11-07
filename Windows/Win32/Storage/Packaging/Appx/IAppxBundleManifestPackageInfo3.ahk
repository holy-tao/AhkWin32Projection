#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestTargetDeviceFamiliesEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfo3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo3
     * @type {Guid}
     */
    static IID => Guid("{6ba74b98-bb74-4296-80d0-5f4256a99675}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTargetDeviceFamilies"]

    /**
     * 
     * @returns {IAppxManifestTargetDeviceFamiliesEnumerator} 
     */
    GetTargetDeviceFamilies() {
        result := ComCall(3, this, "ptr*", &targetDeviceFamilies := 0, "HRESULT")
        return IAppxManifestTargetDeviceFamiliesEnumerator(targetDeviceFamilies)
    }
}

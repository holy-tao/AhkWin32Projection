#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfo3 extends IUnknown{
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
     * 
     * @param {Pointer<IAppxManifestTargetDeviceFamiliesEnumerator>} targetDeviceFamilies 
     * @returns {HRESULT} 
     */
    GetTargetDeviceFamilies(targetDeviceFamilies) {
        result := ComCall(3, this, "ptr", targetDeviceFamilies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

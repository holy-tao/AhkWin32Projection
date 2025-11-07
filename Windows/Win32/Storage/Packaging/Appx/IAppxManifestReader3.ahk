#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestCapabilitiesEnumerator.ahk
#Include .\IAppxManifestTargetDeviceFamiliesEnumerator.ahk
#Include .\IAppxManifestReader2.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader3 extends IAppxManifestReader2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestReader3
     * @type {Guid}
     */
    static IID => Guid("{c43825ab-69b7-400a-9709-cc37f5a72d24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilitiesByCapabilityClass", "GetTargetDeviceFamilies"]

    /**
     * 
     * @param {Integer} capabilityClass 
     * @returns {IAppxManifestCapabilitiesEnumerator} 
     */
    GetCapabilitiesByCapabilityClass(capabilityClass) {
        result := ComCall(13, this, "int", capabilityClass, "ptr*", &capabilities := 0, "HRESULT")
        return IAppxManifestCapabilitiesEnumerator(capabilities)
    }

    /**
     * 
     * @returns {IAppxManifestTargetDeviceFamiliesEnumerator} 
     */
    GetTargetDeviceFamilies() {
        result := ComCall(14, this, "ptr*", &targetDeviceFamilies := 0, "HRESULT")
        return IAppxManifestTargetDeviceFamiliesEnumerator(targetDeviceFamilies)
    }
}

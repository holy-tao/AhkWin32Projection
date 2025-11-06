#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Retrieves information about the target device family from the AppxManifest.xml.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifesttargetdevicefamily
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestTargetDeviceFamily extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestTargetDeviceFamily
     * @type {Guid}
     */
    static IID => Guid("{9091b09b-c8d5-4f31-8687-a338259faefb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetMinVersion", "GetMaxVersionTested"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getminversion
     */
    GetMinVersion() {
        result := ComCall(4, this, "uint*", &minVersion := 0, "HRESULT")
        return minVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getmaxversiontested
     */
    GetMaxVersionTested() {
        result := ComCall(5, this, "uint*", &maxVersionTested := 0, "HRESULT")
        return maxVersionTested
    }
}

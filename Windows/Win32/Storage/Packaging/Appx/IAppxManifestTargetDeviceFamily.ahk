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
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getname
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} minVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getminversion
     */
    GetMinVersion(minVersion) {
        minVersionMarshal := minVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, minVersionMarshal, minVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} maxVersionTested 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifesttargetdevicefamily-getmaxversiontested
     */
    GetMaxVersionTested(maxVersionTested) {
        maxVersionTestedMarshal := maxVersionTested is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, maxVersionTestedMarshal, maxVersionTested, "HRESULT")
        return result
    }
}

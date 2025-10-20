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
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} minVersion 
     * @returns {HRESULT} 
     */
    GetMinVersion(minVersion) {
        result := ComCall(4, this, "uint*", minVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} maxVersionTested 
     * @returns {HRESULT} 
     */
    GetMaxVersionTested(maxVersionTested) {
        result := ComCall(5, this, "uint*", maxVersionTested, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader7 extends IUnknown{
    /**
     * The interface identifier for IAppxManifestReader7
     * @type {Guid}
     */
    static IID => Guid("{8efe6f27-0ce0-4988-b32d-738eb63db3b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAppxManifestDriverDependenciesEnumerator>} driverDependencies 
     * @returns {HRESULT} 
     */
    GetDriverDependencies(driverDependencies) {
        result := ComCall(3, this, "ptr", driverDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestOSPackageDependenciesEnumerator>} osPackageDependencies 
     * @returns {HRESULT} 
     */
    GetOSPackageDependencies(osPackageDependencies) {
        result := ComCall(4, this, "ptr", osPackageDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestHostRuntimeDependenciesEnumerator>} hostRuntimeDependencies 
     * @returns {HRESULT} 
     */
    GetHostRuntimeDependencies(hostRuntimeDependencies) {
        result := ComCall(5, this, "ptr", hostRuntimeDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader7 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDriverDependencies", "GetOSPackageDependencies", "GetHostRuntimeDependencies"]

    /**
     * 
     * @param {Pointer<IAppxManifestDriverDependenciesEnumerator>} driverDependencies 
     * @returns {HRESULT} 
     */
    GetDriverDependencies(driverDependencies) {
        result := ComCall(3, this, "ptr*", driverDependencies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestOSPackageDependenciesEnumerator>} osPackageDependencies 
     * @returns {HRESULT} 
     */
    GetOSPackageDependencies(osPackageDependencies) {
        result := ComCall(4, this, "ptr*", osPackageDependencies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestHostRuntimeDependenciesEnumerator>} hostRuntimeDependencies 
     * @returns {HRESULT} 
     */
    GetHostRuntimeDependencies(hostRuntimeDependencies) {
        result := ComCall(5, this, "ptr*", hostRuntimeDependencies, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestDriverConstraintsEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestDriverDependency extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestDriverDependency
     * @type {Guid}
     */
    static IID => Guid("{1210cb94-5a92-4602-be24-79f318af4af9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDriverConstraints"]

    /**
     * 
     * @returns {IAppxManifestDriverConstraintsEnumerator} 
     */
    GetDriverConstraints() {
        result := ComCall(3, this, "ptr*", &driverConstraints := 0, "HRESULT")
        return IAppxManifestDriverConstraintsEnumerator(driverConstraints)
    }
}

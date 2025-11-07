#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestDriverConstraint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestDriverConstraint
     * @type {Guid}
     */
    static IID => Guid("{c031bee4-bbcc-48ea-a237-c34045c80a07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetMinVersion", "GetMinDate"]

    /**
     * 
     * @returns {PWSTR} 
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMinVersion() {
        result := ComCall(4, this, "uint*", &minVersion := 0, "HRESULT")
        return minVersion
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetMinDate() {
        result := ComCall(5, this, "ptr*", &minDate := 0, "HRESULT")
        return minDate
    }
}

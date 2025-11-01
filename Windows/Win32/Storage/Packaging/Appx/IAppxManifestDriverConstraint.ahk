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
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} minVersion 
     * @returns {HRESULT} 
     */
    GetMinVersion(minVersion) {
        minVersionMarshal := minVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, minVersionMarshal, minVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} minDate 
     * @returns {HRESULT} 
     */
    GetMinDate(minDate) {
        result := ComCall(5, this, "ptr", minDate, "HRESULT")
        return result
    }
}

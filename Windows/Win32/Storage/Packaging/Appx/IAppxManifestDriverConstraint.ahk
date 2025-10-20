#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestDriverConstraint extends IUnknown{
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
     * @param {Pointer<PWSTR>} minDate 
     * @returns {HRESULT} 
     */
    GetMinDate(minDate) {
        result := ComCall(5, this, "ptr", minDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

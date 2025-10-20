#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestQualifiedResource extends IUnknown{
    /**
     * The interface identifier for IAppxManifestQualifiedResource
     * @type {Guid}
     */
    static IID => Guid("{3b53a497-3c5c-48d1-9ea3-bb7eac8cd7d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     */
    GetLanguage(language) {
        result := ComCall(3, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} scale 
     * @returns {HRESULT} 
     */
    GetScale(scale) {
        result := ComCall(4, this, "uint*", scale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} dxFeatureLevel 
     * @returns {HRESULT} 
     */
    GetDXFeatureLevel(dxFeatureLevel) {
        result := ComCall(5, this, "int*", dxFeatureLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

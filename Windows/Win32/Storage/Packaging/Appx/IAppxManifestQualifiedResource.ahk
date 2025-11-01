#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestQualifiedResource extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLanguage", "GetScale", "GetDXFeatureLevel"]

    /**
     * 
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     */
    GetLanguage(language) {
        result := ComCall(3, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} scale 
     * @returns {HRESULT} 
     */
    GetScale(scale) {
        scaleMarshal := scale is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, scaleMarshal, scale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dxFeatureLevel 
     * @returns {HRESULT} 
     */
    GetDXFeatureLevel(dxFeatureLevel) {
        dxFeatureLevelMarshal := dxFeatureLevel is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, dxFeatureLevelMarshal, dxFeatureLevel, "HRESULT")
        return result
    }
}

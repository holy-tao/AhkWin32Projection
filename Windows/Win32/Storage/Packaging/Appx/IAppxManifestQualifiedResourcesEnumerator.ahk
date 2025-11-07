#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestQualifiedResource.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestQualifiedResourcesEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestQualifiedResourcesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{8ef6adfe-3762-4a8f-9373-2fc5d444c8d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * 
     * @returns {IAppxManifestQualifiedResource} 
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &resource := 0, "HRESULT")
        return IAppxManifestQualifiedResource(resource)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetHasCurrent() {
        result := ComCall(4, this, "int*", &hasCurrent := 0, "HRESULT")
        return hasCurrent
    }

    /**
     * 
     * @returns {BOOL} 
     */
    MoveNext() {
        result := ComCall(5, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }
}

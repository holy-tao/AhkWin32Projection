#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestHostRuntimeDependenciesEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestHostRuntimeDependenciesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{6427a646-7f49-433e-b1a6-0da309f6885a}")

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
     * @param {Pointer<IAppxManifestHostRuntimeDependency>} hostRuntimeDependency 
     * @returns {HRESULT} 
     */
    GetCurrent(hostRuntimeDependency) {
        result := ComCall(3, this, "ptr*", hostRuntimeDependency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "HRESULT")
        return result
    }
}

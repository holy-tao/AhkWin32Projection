#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestPackageDependency3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestPackageDependency3
     * @type {Guid}
     */
    static IID => Guid("{1ac56374-6198-4d6b-92e4-749d5ab8a895}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIsOptional"]

    /**
     * 
     * @returns {BOOL} 
     */
    GetIsOptional() {
        result := ComCall(3, this, "int*", &isOptional := 0, "HRESULT")
        return isOptional
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleManifestPackageInfo4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo4
     * @type {Guid}
     */
    static IID => Guid("{5da6f13d-a8a7-4532-857c-1393d659371d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIsStub"]

    /**
     * 
     * @param {Pointer<BOOL>} isStub 
     * @returns {HRESULT} 
     */
    GetIsStub(isStub) {
        result := ComCall(3, this, "ptr", isStub, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestOSPackageDependency extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestOSPackageDependency
     * @type {Guid}
     */
    static IID => Guid("{154995ee-54a6-4f14-ac97-d8cf0519644b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetVersion"]

    /**
     * 
     * @returns {PWSTR} 
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        result := ComCall(4, this, "uint*", &version := 0, "HRESULT")
        return version
    }
}

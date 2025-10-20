#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPackageDebugSettings.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPackageDebugSettings2 extends IPackageDebugSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageDebugSettings2
     * @type {Guid}
     */
    static IID => Guid("{6e3194bb-ab82-4d22-93f5-fabda40e7b16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateApps"]

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Integer>} appCount 
     * @param {Pointer<Pointer<PWSTR>>} appUserModelIds 
     * @param {Pointer<Pointer<PWSTR>>} appDisplayNames 
     * @returns {HRESULT} 
     */
    EnumerateApps(packageFullName, appCount, appUserModelIds, appDisplayNames) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := ComCall(18, this, "ptr", packageFullName, "uint*", appCount, "ptr*", appUserModelIds, "ptr*", appDisplayNames, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IGameExplorer2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameExplorer2
     * @type {Guid}
     */
    static IID => Guid("{86874aa7-a1ed-450d-a7eb-b89e20b2fff3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallGame", "UninstallGame", "CheckAccess"]

    /**
     * 
     * @param {PWSTR} binaryGDFPath 
     * @param {PWSTR} installDirectory 
     * @param {Integer} installScope 
     * @returns {HRESULT} 
     */
    InstallGame(binaryGDFPath, installDirectory, installScope) {
        binaryGDFPath := binaryGDFPath is String ? StrPtr(binaryGDFPath) : binaryGDFPath
        installDirectory := installDirectory is String ? StrPtr(installDirectory) : installDirectory

        result := ComCall(3, this, "ptr", binaryGDFPath, "ptr", installDirectory, "int", installScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} binaryGDFPath 
     * @returns {HRESULT} 
     */
    UninstallGame(binaryGDFPath) {
        binaryGDFPath := binaryGDFPath is String ? StrPtr(binaryGDFPath) : binaryGDFPath

        result := ComCall(4, this, "ptr", binaryGDFPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} binaryGDFPath 
     * @param {Pointer<BOOL>} pHasAccess 
     * @returns {HRESULT} 
     */
    CheckAccess(binaryGDFPath, pHasAccess) {
        binaryGDFPath := binaryGDFPath is String ? StrPtr(binaryGDFPath) : binaryGDFPath

        result := ComCall(5, this, "ptr", binaryGDFPath, "ptr", pHasAccess, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Foundation\BSTR.ahk
#Include .\GAME_INSTALL_SCOPE.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk
#Include ..\Foundation\BOOL.ahk
#Include ..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Gaming
 */
class IGameExplorer extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameExplorer
     * @type {Guid}
     */
    static IID => Guid("{e7b2fb72-d728-49b3-a5f2-18ebf5f1349e}")

    /**
     * The class identifier for GameExplorer
     * @type {Guid}
     */
    static CLSID => Guid("{9a5ea990-3034-4d6f-9128-01f3c61022bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddGame", "RemoveGame", "UpdateGame", "VerifyAccess"]

    /**
     * 
     * @param {BSTR} bstrGDFBinaryPath 
     * @param {BSTR} bstrGameInstallDirectory 
     * @param {GAME_INSTALL_SCOPE} installScope 
     * @param {Pointer<Guid>} pguidInstanceID 
     * @returns {HRESULT} 
     */
    AddGame(bstrGDFBinaryPath, bstrGameInstallDirectory, installScope, pguidInstanceID) {
        bstrGDFBinaryPath := bstrGDFBinaryPath is String ? BSTR.Alloc(bstrGDFBinaryPath).Value : bstrGDFBinaryPath
        bstrGameInstallDirectory := bstrGameInstallDirectory is String ? BSTR.Alloc(bstrGameInstallDirectory).Value : bstrGameInstallDirectory

        result := ComCall(3, this, "ptr", bstrGDFBinaryPath, "ptr", bstrGameInstallDirectory, "int", installScope, "ptr", pguidInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidInstanceID 
     * @returns {HRESULT} 
     */
    RemoveGame(guidInstanceID) {
        result := ComCall(4, this, "ptr", guidInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidInstanceID 
     * @returns {HRESULT} 
     */
    UpdateGame(guidInstanceID) {
        result := ComCall(5, this, "ptr", guidInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGDFBinaryPath 
     * @returns {BOOL} 
     */
    VerifyAccess(bstrGDFBinaryPath) {
        bstrGDFBinaryPath := bstrGDFBinaryPath is String ? BSTR.Alloc(bstrGDFBinaryPath).Value : bstrGDFBinaryPath

        result := ComCall(6, this, "ptr", bstrGDFBinaryPath, "int*", &pfHasAccess := 0, "HRESULT")
        return pfHasAccess
    }
}

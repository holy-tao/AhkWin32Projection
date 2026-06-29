#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GAME_INSTALL_SCOPE.ahk" { GAME_INSTALL_SCOPE }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct IGameExplorer2 extends IUnknown {
    /**
     * The interface identifier for IGameExplorer2
     * @type {Guid}
     */
    static IID := Guid("{86874aa7-a1ed-450d-a7eb-b89e20b2fff3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameExplorer2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InstallGame   : IntPtr
        UninstallGame : IntPtr
        CheckAccess   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameExplorer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} binaryGDFPath 
     * @param {PWSTR} installDirectory 
     * @param {GAME_INSTALL_SCOPE} installScope 
     * @returns {HRESULT} 
     */
    InstallGame(binaryGDFPath, installDirectory, installScope) {
        binaryGDFPath := binaryGDFPath is String ? StrPtr(binaryGDFPath) : binaryGDFPath
        installDirectory := installDirectory is String ? StrPtr(installDirectory) : installDirectory

        result := ComCall(3, this, "ptr", binaryGDFPath, "ptr", installDirectory, GAME_INSTALL_SCOPE, installScope, "HRESULT")
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
     * @returns {BOOL} 
     */
    CheckAccess(binaryGDFPath) {
        binaryGDFPath := binaryGDFPath is String ? StrPtr(binaryGDFPath) : binaryGDFPath

        result := ComCall(5, this, "ptr", binaryGDFPath, BOOL.Ptr, &pHasAccess := 0, "HRESULT")
        return pHasAccess
    }

    Query(iid) {
        if (IGameExplorer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InstallGame := CallbackCreate(GetMethod(implObj, "InstallGame"), flags, 4)
        this.vtbl.UninstallGame := CallbackCreate(GetMethod(implObj, "UninstallGame"), flags, 2)
        this.vtbl.CheckAccess := CallbackCreate(GetMethod(implObj, "CheckAccess"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InstallGame)
        CallbackFree(this.vtbl.UninstallGame)
        CallbackFree(this.vtbl.CheckAccess)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GAME_INSTALL_SCOPE.ahk" { GAME_INSTALL_SCOPE }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct IGameExplorer extends IUnknown {
    /**
     * The interface identifier for IGameExplorer
     * @type {Guid}
     */
    static IID := Guid("{e7b2fb72-d728-49b3-a5f2-18ebf5f1349e}")

    /**
     * The class identifier for GameExplorer
     * @type {Guid}
     */
    static CLSID := Guid("{9a5ea990-3034-4d6f-9128-01f3c61022bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameExplorer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddGame      : IntPtr
        RemoveGame   : IntPtr
        UpdateGame   : IntPtr
        VerifyAccess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameExplorer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(3, this, BSTR, bstrGDFBinaryPath, BSTR, bstrGameInstallDirectory, GAME_INSTALL_SCOPE, installScope, Guid.Ptr, pguidInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidInstanceID 
     * @returns {HRESULT} 
     */
    RemoveGame(guidInstanceID) {
        result := ComCall(4, this, Guid, guidInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidInstanceID 
     * @returns {HRESULT} 
     */
    UpdateGame(guidInstanceID) {
        result := ComCall(5, this, Guid, guidInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGDFBinaryPath 
     * @returns {BOOL} 
     */
    VerifyAccess(bstrGDFBinaryPath) {
        bstrGDFBinaryPath := bstrGDFBinaryPath is String ? BSTR.Alloc(bstrGDFBinaryPath).Value : bstrGDFBinaryPath

        result := ComCall(6, this, BSTR, bstrGDFBinaryPath, BOOL.Ptr, &pfHasAccess := 0, "HRESULT")
        return pfHasAccess
    }

    Query(iid) {
        if (IGameExplorer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddGame := CallbackCreate(GetMethod(implObj, "AddGame"), flags, 5)
        this.vtbl.RemoveGame := CallbackCreate(GetMethod(implObj, "RemoveGame"), flags, 2)
        this.vtbl.UpdateGame := CallbackCreate(GetMethod(implObj, "UpdateGame"), flags, 2)
        this.vtbl.VerifyAccess := CallbackCreate(GetMethod(implObj, "VerifyAccess"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddGame)
        CallbackFree(this.vtbl.RemoveGame)
        CallbackFree(this.vtbl.UpdateGame)
        CallbackFree(this.vtbl.VerifyAccess)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcVersionInfo.ahk" { IDxcVersionInfo }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcVersionInfo2 extends IDxcVersionInfo {
    /**
     * The interface identifier for IDxcVersionInfo2
     * @type {Guid}
     */
    static IID := Guid("{fb6904c4-42f0-4b62-9c46-983af7da7c83}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcVersionInfo2 interfaces
    */
    struct Vtbl extends IDxcVersionInfo.Vtbl {
        GetCommitInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcVersionInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pCommitCount 
     * @param {Pointer<Pointer<Integer>>} pCommitHash 
     * @returns {HRESULT} 
     */
    GetCommitInfo(pCommitCount, pCommitHash) {
        pCommitCountMarshal := pCommitCount is VarRef ? "uint*" : "ptr"
        pCommitHashMarshal := pCommitHash is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pCommitCountMarshal, pCommitCount, pCommitHashMarshal, pCommitHash, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDxcVersionInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCommitInfo := CallbackCreate(GetMethod(implObj, "GetCommitInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCommitInfo)
    }
}

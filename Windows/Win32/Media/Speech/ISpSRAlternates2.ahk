#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPPHRASEALTREQUEST.ahk" { SPPHRASEALTREQUEST }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpSRAlternates.ahk" { ISpSRAlternates }
#Import ".\SPCOMMITFLAGS.ahk" { SPCOMMITFLAGS }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSRAlternates2 extends ISpSRAlternates {
    /**
     * The interface identifier for ISpSRAlternates2
     * @type {Guid}
     */
    static IID := Guid("{f338f437-cb33-4020-9cab-c71ff9ce12d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSRAlternates2 interfaces
    */
    struct Vtbl extends ISpSRAlternates.Vtbl {
        CommitText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSRAlternates2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPPHRASEALTREQUEST>} pAltRequest 
     * @param {PWSTR} pcszNewText 
     * @param {SPCOMMITFLAGS} commitFlags 
     * @returns {HRESULT} 
     */
    CommitText(pAltRequest, pcszNewText, commitFlags) {
        pcszNewText := pcszNewText is String ? StrPtr(pcszNewText) : pcszNewText

        result := ComCall(5, this, SPPHRASEALTREQUEST.Ptr, pAltRequest, "ptr", pcszNewText, SPCOMMITFLAGS, commitFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpSRAlternates2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CommitText := CallbackCreate(GetMethod(implObj, "CommitText"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CommitText)
    }
}

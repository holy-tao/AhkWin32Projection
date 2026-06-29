#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUrlHistoryStg.ahk" { IUrlHistoryStg }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\IOleCommandTarget.ahk" { IOleCommandTarget }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IUrlHistoryStg2 extends IUrlHistoryStg {
    /**
     * The interface identifier for IUrlHistoryStg2
     * @type {Guid}
     */
    static IID := Guid("{afa0dc11-c313-11d0-831a-00c04fd5ae38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUrlHistoryStg2 interfaces
    */
    struct Vtbl extends IUrlHistoryStg.Vtbl {
        AddUrlAndNotify : IntPtr
        ClearHistory    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUrlHistoryStg2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {PWSTR} pocsTitle 
     * @param {Integer} dwFlags 
     * @param {BOOL} fWriteHistory 
     * @param {IOleCommandTarget} poctNotify 
     * @param {IUnknown} punkISFolder 
     * @returns {HRESULT} 
     */
    AddUrlAndNotify(pocsUrl, pocsTitle, dwFlags, fWriteHistory, poctNotify, punkISFolder) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl
        pocsTitle := pocsTitle is String ? StrPtr(pocsTitle) : pocsTitle

        result := ComCall(8, this, "ptr", pocsUrl, "ptr", pocsTitle, "uint", dwFlags, BOOL, fWriteHistory, "ptr", poctNotify, "ptr", punkISFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearHistory() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUrlHistoryStg2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddUrlAndNotify := CallbackCreate(GetMethod(implObj, "AddUrlAndNotify"), flags, 7)
        this.vtbl.ClearHistory := CallbackCreate(GetMethod(implObj, "ClearHistory"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddUrlAndNotify)
        CallbackFree(this.vtbl.ClearHistory)
    }
}

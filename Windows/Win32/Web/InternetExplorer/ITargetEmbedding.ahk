#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITargetFrame.ahk" { ITargetFrame }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ITargetEmbedding extends IUnknown {
    /**
     * The interface identifier for ITargetEmbedding
     * @type {Guid}
     */
    static IID := Guid("{548793c0-9e74-11cf-9655-00a0c9034923}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITargetEmbedding interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTargetFrame : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITargetEmbedding.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ITargetFrame} 
     */
    GetTargetFrame() {
        result := ComCall(3, this, "ptr*", &ppTargetFrame := 0, "HRESULT")
        return ITargetFrame(ppTargetFrame)
    }

    Query(iid) {
        if (ITargetEmbedding.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTargetFrame := CallbackCreate(GetMethod(implObj, "GetTargetFrame"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTargetFrame)
    }
}

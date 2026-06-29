#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IFClipNotificationHelper extends IUnknown {
    /**
     * The interface identifier for IFClipNotificationHelper
     * @type {Guid}
     */
    static IID := Guid("{3d5e3d21-bd41-4c2a-a669-b17ce87fb50b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFClipNotificationHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowSystemDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFClipNotificationHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} titleText 
     * @param {BSTR} bodyText 
     * @returns {HRESULT} 
     */
    ShowSystemDialog(titleText, bodyText) {
        titleText := titleText is String ? BSTR.Alloc(titleText).Value : titleText
        bodyText := bodyText is String ? BSTR.Alloc(bodyText).Value : bodyText

        result := ComCall(3, this, BSTR, titleText, BSTR, bodyText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFClipNotificationHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowSystemDialog := CallbackCreate(GetMethod(implObj, "ShowSystemDialog"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowSystemDialog)
    }
}

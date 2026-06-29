#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPMedia.ahk" { IWMPMedia }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPErrorItem.ahk" { IWMPErrorItem }

/**
 * The IWMPMedia2 interface provides a method that supplements the IWMPMedia interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmedia2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPMedia2 extends IWMPMedia {
    /**
     * The interface identifier for IWMPMedia2
     * @type {Guid}
     */
    static IID := Guid("{ab7c88bb-143e-4ea4-acc3-e4350b2106c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPMedia2 interfaces
    */
    struct Vtbl extends IWMPMedia.Vtbl {
        get_error : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPMedia2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWMPErrorItem} 
     */
    error {
        get => this.get_error()
    }

    /**
     * The get_error method retrieves a pointer to an IWMPErrorItem interface if the media item has an error condition.
     * @remarks
     * If the media item cannot be played, this property retrieves an <b>IWMPErrorItem</b> interface that contains information about the problem encountered.
     * @returns {IWMPErrorItem} Pointer to a pointer to an <b>IWMPErrorItem</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia2-get_error
     */
    get_error() {
        result := ComCall(25, this, "ptr*", &ppIWMPErrorItem := 0, "HRESULT")
        return IWMPErrorItem(ppIWMPErrorItem)
    }

    Query(iid) {
        if (IWMPMedia2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_error := CallbackCreate(GetMethod(implObj, "get_error"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_error)
    }
}

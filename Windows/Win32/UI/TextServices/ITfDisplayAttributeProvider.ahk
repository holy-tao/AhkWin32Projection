#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfDisplayAttributeInfo.ahk" { ITfDisplayAttributeInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTfDisplayAttributeInfo.ahk" { IEnumTfDisplayAttributeInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfDisplayAttributeProvider interface is implemented by a text service and is used by the TSF manager to enumerate and obtain individual display attribute information objects.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfdisplayattributeprovider
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfDisplayAttributeProvider extends IUnknown {
    /**
     * The interface identifier for ITfDisplayAttributeProvider
     * @type {Guid}
     */
    static IID := Guid("{fee47777-163c-4769-996a-6e9c50ad8f54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfDisplayAttributeProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumDisplayAttributeInfo : IntPtr
        GetDisplayAttributeInfo  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfDisplayAttributeProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfDisplayAttributeProvider::EnumDisplayAttributeInfo method
     * @returns {IEnumTfDisplayAttributeInfo} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfdisplayattributeinfo">IEnumTfDisplayAttributeInfo</a> interface pointer that receives the enumerator object. The caller must release this interface when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeprovider-enumdisplayattributeinfo
     */
    EnumDisplayAttributeInfo() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDisplayAttributeInfo(ppEnum)
    }

    /**
     * ITfDisplayAttributeProvider::GetDisplayAttributeInfo method
     * @param {Pointer<Guid>} guid Contains a GUID value that identifies the display attribute to obtain the display attribute information object for. The text service must publish these values and what they indicate. This identifier can also be obtained by enumerating the display attributes for a range of text.
     * @returns {ITfDisplayAttributeInfo} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdisplayattributeinfo">ITfDisplayAttributeInfo</a> interface pointer that receives the display attribute information object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeprovider-getdisplayattributeinfo
     */
    GetDisplayAttributeInfo(guid) {
        result := ComCall(4, this, Guid.Ptr, guid, "ptr*", &ppInfo := 0, "HRESULT")
        return ITfDisplayAttributeInfo(ppInfo)
    }

    Query(iid) {
        if (ITfDisplayAttributeProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumDisplayAttributeInfo := CallbackCreate(GetMethod(implObj, "EnumDisplayAttributeInfo"), flags, 2)
        this.vtbl.GetDisplayAttributeInfo := CallbackCreate(GetMethod(implObj, "GetDisplayAttributeInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumDisplayAttributeInfo)
        CallbackFree(this.vtbl.GetDisplayAttributeInfo)
    }
}

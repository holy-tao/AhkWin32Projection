#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfTransitoryExtensionSink interface is implemented by the application that uses Transitory Extension dim. The application can track the changes that happened in the transitory extension by using this sink interface.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftransitoryextensionsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfTransitoryExtensionSink extends IUnknown {
    /**
     * The interface identifier for ITfTransitoryExtensionSink
     * @type {Guid}
     */
    static IID := Guid("{a615096f-1c57-4813-8a15-55ee6e5a839c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfTransitoryExtensionSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnTransitoryExtensionUpdated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfTransitoryExtensionSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfTransitoryExtensionSink::OnTransitoryExtensionUpdated method
     * @param {ITfContext} pic [in] A pointer of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface. This is a context object in which the update happened.
     * @param {Integer} ecReadOnly [in] A read only edit cookie to access the <i>pic</i>. Using this edit cookie, the application can get the text that is contained in the context object.
     * @param {ITfRange} pResultRange [in] A pointer of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface. This is the range of the result string (determined string).
     * @param {ITfRange} pCompositionRange [in] A pointer of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface. This is the range of the current composition string.
     * @returns {BOOL} [out] A pointer to return the bool value. If it is true, TSF manager deletes the result range so only the current composition range remains in the transitory extension.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftransitoryextensionsink-ontransitoryextensionupdated
     */
    OnTransitoryExtensionUpdated(pic, ecReadOnly, pResultRange, pCompositionRange) {
        result := ComCall(3, this, "ptr", pic, "uint", ecReadOnly, "ptr", pResultRange, "ptr", pCompositionRange, BOOL.Ptr, &pfDeleteResultRange := 0, "HRESULT")
        return pfDeleteResultRange
    }

    Query(iid) {
        if (ITfTransitoryExtensionSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTransitoryExtensionUpdated := CallbackCreate(GetMethod(implObj, "OnTransitoryExtensionUpdated"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTransitoryExtensionUpdated)
    }
}

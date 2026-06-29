#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumString.ahk" { IEnumString }
#Import ".\ITfInputScope.ahk" { ITfInputScope }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITfInputScope2 interface is used by the text input processors to get the IEnumString interface pointer and this IEnumString interface enumerates the word list that the application specified for this context.
 * @see https://learn.microsoft.com/windows/win32/api/inputscope/nn-inputscope-itfinputscope2
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfInputScope2 extends ITfInputScope {
    /**
     * The interface identifier for ITfInputScope2
     * @type {Guid}
     */
    static IID := Guid("{5731eaa0-6bc2-4681-a532-92fbb74d7c41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfInputScope2 interfaces
    */
    struct Vtbl extends ITfInputScope.Vtbl {
        EnumWordList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfInputScope2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfInputScope2::EnumWordList method
     * @returns {IEnumString} A pointer to obtain the IEnumString interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/inputscope/nf-inputscope-itfinputscope2-enumwordlist
     */
    EnumWordList() {
        result := ComCall(8, this, "ptr*", &ppEnumString := 0, "HRESULT")
        return IEnumString(ppEnumString)
    }

    Query(iid) {
        if (ITfInputScope2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumWordList := CallbackCreate(GetMethod(implObj, "EnumWordList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumWordList)
    }
}

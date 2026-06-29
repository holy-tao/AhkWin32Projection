#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a list of the keystroke sequences required to create a specified string.
 * @remarks
 * This interface is used to store the results of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfreverseconversion-doreverseconversion">ITfReverseConversionList::DoReverseConversion</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfreverseconversionlist
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfReverseConversionList extends IUnknown {
    /**
     * The interface identifier for ITfReverseConversionList
     * @type {Guid}
     */
    static IID := Guid("{151d69f0-86f4-4674-b721-56911e797f47}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfReverseConversionList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength : IntPtr
        GetString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfReverseConversionList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of keystroke sequences in the list.
     * @returns {Integer} The number of keystroke sequences  in the list.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreverseconversionlist-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint*", &puIndex := 0, "HRESULT")
        return puIndex
    }

    /**
     * Retrieves the keystroke sequence at the specified index.
     * @param {Integer} uIndex The index of the keystroke sequence to retrieve.
     * @returns {BSTR} The keystroke sequence at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreverseconversionlist-getstring
     */
    GetString(uIndex) {
        pbstr := BSTR.Owned()
        result := ComCall(4, this, "uint", uIndex, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    Query(iid) {
        if (ITfReverseConversionList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetString)
    }
}

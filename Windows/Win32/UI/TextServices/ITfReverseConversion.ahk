#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfReverseConversionList.ahk" { ITfReverseConversionList }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Performs a reverse conversion of a specified string.
 * @remarks
 * A reverse conversion provides the keystroke sequences required to create the specified string.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfreverseconversion
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfReverseConversion extends IUnknown {
    /**
     * The interface identifier for ITfReverseConversion
     * @type {Guid}
     */
    static IID := Guid("{a415e162-157d-417d-8a8c-0ab26c7d2781}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfReverseConversion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoReverseConversion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfReverseConversion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs a reverse conversion of the specified string.
     * @remarks
     * A reverse conversion provides the keystroke sequences required to create the specified string.
     * @param {PWSTR} lpstr The string to convert.
     * @returns {ITfReverseConversionList} The result of the conversion: a list of the key strokes required to create the string specified by <i>lpstr</i>.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreverseconversion-doreverseconversion
     */
    DoReverseConversion(lpstr) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(3, this, "ptr", lpstr, "ptr*", &ppList := 0, "HRESULT")
        return ITfReverseConversionList(ppList)
    }

    Query(iid) {
        if (ITfReverseConversion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoReverseConversion := CallbackCreate(GetMethod(implObj, "DoReverseConversion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoReverseConversion)
    }
}

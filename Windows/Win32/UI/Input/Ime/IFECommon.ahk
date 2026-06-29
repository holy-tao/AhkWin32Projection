#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMEDLG.ahk" { IMEDLG }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The IFECommon interface provides IME-related services that are common for different languages.
 * @remarks
 * Create an instance of this interface with the <a href="https://docs.microsoft.com/windows/desktop/api/msime/nf-msime-createifecommoninstance">CreateIFECommonInstance</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/msime/nn-msime-ifecommon
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IFECommon extends IUnknown {
    /**
     * The interface identifier for IFECommon
     * @type {Guid}
     */
    static IID := Guid("{019f7151-e6db-11d0-83c3-00c04fddb82e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFECommon interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsDefaultIME         : IntPtr
        SetDefaultIME        : IntPtr
        InvokeWordRegDialog  : IntPtr
        InvokeDictToolDialog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFECommon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines if the IME specified by the class ID is the default IME on a local computer.
     * @param {PSTR} szName The name of the IME for the specified class ID. Can be <b>NULL</b>.
     * @param {Integer} cszName The size of <i>szName</i> in bytes.
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> if this Microsoft IME is already the default IME.</li>
     * <li><b>S_FALSE</b> if this Microsoft IME is not the default IME.</li>
     * <li>Otherwise <b>E_FAIL</b>.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-isdefaultime
     */
    IsDefaultIME(szName, cszName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "int", cszName, "HRESULT")
        return result
    }

    /**
     * Allows the Microsoft IME to become the default IME in the keyboard layout.
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> if successful.</li>
     * <li><b>IFEC_S_ALREADY_DEFAULT</b> if this Microsoft IME is already the default IME.</li>
     * <li>Otherwise <b>E_FAIL</b>.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-setdefaultime
     */
    SetDefaultIME() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Invokes the Microsoft IME Word Register Dialog Window from the app.
     * @param {Pointer<IMEDLG>} pimedlg Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imedlg">IMEDLG</a> structure.
     * @returns {HRESULT} <b>S_OK</b> if successful, 
     * otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-invokewordregdialog
     */
    InvokeWordRegDialog(pimedlg) {
        result := ComCall(5, this, IMEDLG.Ptr, pimedlg, "HRESULT")
        return result
    }

    /**
     * Invokes the Microsoft IME's Dictionary Tool from the app.
     * @param {Pointer<IMEDLG>} pimedlg Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imedlg">IMEDLG</a> structure.
     * @returns {HRESULT} <b>S_OK</b> if successful, 
     * otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-invokedicttooldialog
     */
    InvokeDictToolDialog(pimedlg) {
        result := ComCall(6, this, IMEDLG.Ptr, pimedlg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFECommon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsDefaultIME := CallbackCreate(GetMethod(implObj, "IsDefaultIME"), flags, 3)
        this.vtbl.SetDefaultIME := CallbackCreate(GetMethod(implObj, "SetDefaultIME"), flags, 1)
        this.vtbl.InvokeWordRegDialog := CallbackCreate(GetMethod(implObj, "InvokeWordRegDialog"), flags, 2)
        this.vtbl.InvokeDictToolDialog := CallbackCreate(GetMethod(implObj, "InvokeDictToolDialog"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsDefaultIME)
        CallbackFree(this.vtbl.SetDefaultIME)
        CallbackFree(this.vtbl.InvokeWordRegDialog)
        CallbackFree(this.vtbl.InvokeDictToolDialog)
    }
}

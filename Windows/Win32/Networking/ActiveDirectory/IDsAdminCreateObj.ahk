#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IADsContainer.ahk" { IADsContainer }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by an application or component to programmatically start a creation wizard for a specified object class.
 * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nn-dsadmin-idsadmincreateobj
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsAdminCreateObj extends IUnknown {
    /**
     * The interface identifier for IDsAdminCreateObj
     * @type {Guid}
     */
    static IID := Guid("{53554a38-f902-11d2-82b9-00c04f68928b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsAdminCreateObj interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize  : IntPtr
        CreateModal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsAdminCreateObj.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDsAdminCreateObj::Initialize method initializes an IDsAdminCreateObj object with data about the container where the object will be created, the class of the object to be created and, possibly, the source object to copy from.
     * @remarks
     * The <b>IDsAdminCreateObj::Initialize</b> method must be called before <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadmincreateobj-createmodal">IDsAdminCreateObj::CreateModal</a> can be called.
     * @param {IADsContainer} pADsContainerObj Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> interface that represents the  container where the object will be created. This parameter must not be <b>NULL</b>.
     * @param {IADs} pADsCopySource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface of the object from which a copy is made. If the new object is not copied from another object, this parameter is <b>NULL</b>. The copy operation is only supported for user objects.
     * @param {PWSTR} lpszClassName Pointer to a <b>WCHAR</b> string that contains the LDAP name of the object class to be created. This parameter must not be <b>NULL</b>. Supported values are: "user", "computer", "printQueue", "group" and "contact".
     * @returns {HRESULT} If the method succeeds, 
     *       <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadmincreateobj-initialize
     */
    Initialize(pADsContainerObj, pADsCopySource, lpszClassName) {
        lpszClassName := lpszClassName is String ? StrPtr(lpszClassName) : lpszClassName

        result := ComCall(3, this, "ptr", pADsContainerObj, "ptr", pADsCopySource, "ptr", lpszClassName, "HRESULT")
        return result
    }

    /**
     * The IDsAdminCreateObj::CreateModal method displays the object creation wizard and returns the newly created object. The IDsAdminCreateObj::Initialize method must be called before IDsAdminCreateObj::CreateModal can be called.
     * @remarks
     * If the user cancels the object creation wizard, this method returns S_FALSE.  If <i>ppADsObj</i> is not <b>NULL</b>, <i>ppADsObj</i> receives a <b>NULL</b> value. Because of this, the use of the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> macro to determine if <i>ppADsObj</i> is valid should be avoided. Always test the contents of <i>ppADsObj</i> for a non-<b>NULL</b> value before using the interface pointer.
     * @param {HWND} hwndParent Contains the window handle of the owner of the wizard. This value cannot be <b>NULL</b>. Use the result of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdesktopwindow">GetDesktopWindow</a> function if no parent window is available.
     * @returns {IADs} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface pointer that receives the newly created object. This parameter receives <b>NULL</b> if the object creation wizard fails or is canceled. The caller must release this interface when it is no longer required. This parameter may be <b>NULL</b> if this object is not required.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadmincreateobj-createmodal
     */
    CreateModal(hwndParent) {
        result := ComCall(4, this, HWND, hwndParent, "ptr*", &ppADsObj := 0, "HRESULT")
        return IADs(ppADsObj)
    }

    Query(iid) {
        if (IDsAdminCreateObj.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.CreateModal := CallbackCreate(GetMethod(implObj, "CreateModal"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.CreateModal)
    }
}

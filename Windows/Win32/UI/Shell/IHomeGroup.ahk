#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\HOMEGROUPSHARINGCHOICES.ahk" { HOMEGROUPSHARINGCHOICES }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that determine a computer's HomeGroup membership status and display the sharing wizard.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Custom implementations of <b>IHomeGroup</b> are not supported; client applications use the implementation provided in Provsvc.dll.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use <b>IHomeGroup</b> when there is a need to determine the local computer's HomeGroup membership status; that is, to check wither the local computer is a member of a HomeGroup.
 * 
 * 
 * 
 * To create an instance of <b>IHomeGroup</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> and specify <b>CLSID_HomeGroup</b> as the CLSID. <b>CLSID_HomeGroup</b> is defined in Shobjidl.h and Shobjidl.idl.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ihomegroup
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHomeGroup extends IUnknown {
    /**
     * The interface identifier for IHomeGroup
     * @type {Guid}
     */
    static IID := Guid("{7a3bd1d9-35a9-4fb3-a467-f48cac35e2d0}")

    /**
     * The class identifier for HomeGroup
     * @type {Guid}
     */
    static CLSID := Guid("{de77ba04-3c92-4d11-a1a5-42352a53e0e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHomeGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsMember          : IntPtr
        ShowSharingWizard : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHomeGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the local computer is a member of a HomeGroup.
     * @remarks
     * The following code snippet shows how to create an instance of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ihomegroup">IHomeGroup</a> and call <b>IHomeGroup::IsMember</b>.
     *          
     *                 
     * 
     * 
     * ```
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns successfully, receives <b>TRUE</b> if the local computer is a member of a HomeGroup; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihomegroup-ismember
     */
    IsMember() {
        result := ComCall(3, this, BOOL.Ptr, &member := 0, "HRESULT")
        return member
    }

    /**
     * Displays a wizard that allows a user to create a Home Group, and then retrieves the sharing options that the user selected through the wizard.
     * @remarks
     * This method must be called from a single-threaded apartment (STA) thread.
     * @param {HWND} owner Type: <b>HWND</b>
     * 
     * Handle of the owner window of the wizard, used for notifications. This value can be <b>NULL</b>.
     * @returns {HOMEGROUPSHARINGCHOICES} Type: <b>HOMEGROUPSHARINGCHOICES*</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihomegroup-showsharingwizard
     */
    ShowSharingWizard(owner) {
        result := ComCall(4, this, HWND, owner, "int*", &sharingchoices := 0, "HRESULT")
        return sharingchoices
    }

    Query(iid) {
        if (IHomeGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsMember := CallbackCreate(GetMethod(implObj, "IsMember"), flags, 2)
        this.vtbl.ShowSharingWizard := CallbackCreate(GetMethod(implObj, "ShowSharingWizard"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsMember)
        CallbackFree(this.vtbl.ShowSharingWizard)
    }
}

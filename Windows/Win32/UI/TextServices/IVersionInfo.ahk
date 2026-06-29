#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that supply version information for accessible elements.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-iversioninfo
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IVersionInfo extends IUnknown {
    /**
     * The interface identifier for IVersionInfo
     * @type {Guid}
     */
    static IID := Guid("{401518ec-db00-4611-9b29-2a0e4b9afa85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVersionInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSubcomponentCount    : IntPtr
        GetImplementationID     : IntPtr
        GetBuildVersion         : IntPtr
        GetComponentDescription : IntPtr
        GetInstanceDescription  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVersionInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Clients call IVersionInfo::GetSubcomponentCount to determine the number of subcomponents for which version information is returned.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a>*</b>
     * 
     * The number of subcomponents that this component will expose version information about.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getsubcomponentcount
     */
    GetSubcomponentCount(ulSub) {
        result := ComCall(3, this, "uint", ulSub, "uint*", &ulCount := 0, "HRESULT")
        return ulCount
    }

    /**
     * Clients call IVersionInfo::GetImplementationID to retrieve a unique identifier for the component.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * An implementation identifier for the component. The implementation identifier is unique for this component and is used only for comparing components.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getimplementationid
     */
    GetImplementationID(ulSub) {
        implid := Guid()
        result := ComCall(4, this, "uint", ulSub, Guid.Ptr, implid, "HRESULT")
        return implid
    }

    /**
     * Clients call IVersionInfo::GetBuildVersion to retrieve build information for a specified component.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @param {Pointer<Integer>} pdwMajor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The major build version of the component specified in <i>ulSub</i>.
     * @param {Pointer<Integer>} pdwMinor Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * The minor build version of the component specified in <i>ulSub</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK. If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getbuildversion
     */
    GetBuildVersion(ulSub, pdwMajor, pdwMinor) {
        pdwMajorMarshal := pdwMajor is VarRef ? "uint*" : "ptr"
        pdwMinorMarshal := pdwMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulSub, pdwMajorMarshal, pdwMajor, pdwMinorMarshal, pdwMinor, "HRESULT")
        return result
    }

    /**
     * Clients call this method to retrieve a description of the component.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * String of the form of "Company, suite, component, version." This is for human consumption and is not expected to be 
     * 			 parsed.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getcomponentdescription
     */
    GetComponentDescription(ulSub) {
        pImplStr := BSTR.Owned()
        result := ComCall(6, this, "uint", ulSub, BSTR.Ptr, pImplStr, "HRESULT")
        return pImplStr
    }

    /**
     * Clients call this method to retrieve a description of the instance.Note  Active Accessibility Text Services is deprecated.
     * @param {Integer} ulSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The ordinal position of the component in the tree.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Additional useful strings for the component, such as the internal object state.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getinstancedescription
     */
    GetInstanceDescription(ulSub) {
        pImplStr := BSTR.Owned()
        result := ComCall(7, this, "uint", ulSub, BSTR.Ptr, pImplStr, "HRESULT")
        return pImplStr
    }

    Query(iid) {
        if (IVersionInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSubcomponentCount := CallbackCreate(GetMethod(implObj, "GetSubcomponentCount"), flags, 3)
        this.vtbl.GetImplementationID := CallbackCreate(GetMethod(implObj, "GetImplementationID"), flags, 3)
        this.vtbl.GetBuildVersion := CallbackCreate(GetMethod(implObj, "GetBuildVersion"), flags, 4)
        this.vtbl.GetComponentDescription := CallbackCreate(GetMethod(implObj, "GetComponentDescription"), flags, 3)
        this.vtbl.GetInstanceDescription := CallbackCreate(GetMethod(implObj, "GetInstanceDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSubcomponentCount)
        CallbackFree(this.vtbl.GetImplementationID)
        CallbackFree(this.vtbl.GetBuildVersion)
        CallbackFree(this.vtbl.GetComponentDescription)
        CallbackFree(this.vtbl.GetInstanceDescription)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NSTCFOLDERCAPABILITIES.ahk" { NSTCFOLDERCAPABILITIES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a single method that retrieves the status of a folder's System.IsPinnedToNameSpaceTree filtering support.
 * @remarks
 * The namespace tree control checks all the nodes it enumerates to see if they support filtering. This is done by retrieving the <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-ispinnedtonamespacetree">System.IsPinnedToNameSpaceTree</a> property for the shell folders that support this interface. Nodes that do not support this interface do not have filtering support and are shown by default.
 * 
 * Use this interface to retrieve the filtering support status of a shell folder.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrolfoldercapabilities
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeControlFolderCapabilities extends IUnknown {
    /**
     * The interface identifier for INameSpaceTreeControlFolderCapabilities
     * @type {Guid}
     */
    static IID := Guid("{e9701183-e6b3-4ff2-8568-813615fec7be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeControlFolderCapabilities interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFolderCapabilities : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeControlFolderCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a folder's capability to be filtered through the System.IsPinnedToNameSpaceTree property key value and change notification registration status.
     * @param {NSTCFOLDERCAPABILITIES} nfcMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nstcfoldercapabilities">NSTCFOLDERCAPABILITIES</a></b>
     * 
     * The capabilities for which this method should retrieve values. Specify one or both of the following:
     * @returns {NSTCFOLDERCAPABILITIES} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-nstcfoldercapabilities">NSTCFOLDERCAPABILITIES</a>*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the capabilities requested in <i>nfcMask</i>. Except in the case of NSTCFC_NONE, bit values in positions not specifically requested in <i>nfcMask</i> do not necessarily reflect the capabilities and should not be used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrolfoldercapabilities-getfoldercapabilities
     */
    GetFolderCapabilities(nfcMask) {
        result := ComCall(3, this, NSTCFOLDERCAPABILITIES, nfcMask, "int*", &pnfcValue := 0, "HRESULT")
        return pnfcValue
    }

    Query(iid) {
        if (INameSpaceTreeControlFolderCapabilities.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFolderCapabilities := CallbackCreate(GetMethod(implObj, "GetFolderCapabilities"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFolderCapabilities)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows a browser or host to ask IShellView what kind of view behavior is supported.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ibrowserframeoptions
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBrowserFrameOptions extends IUnknown {
    /**
     * The interface identifier for IBrowserFrameOptions
     * @type {Guid}
     */
    static IID := Guid("{10df43c8-1dbe-11d3-8b34-006097df5bd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBrowserFrameOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFrameOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBrowserFrameOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the available browser frame view options.
     * @remarks
     * If the method succeeds, the return value is S_OK and <i>pdwOptions</i> contains the subset of available view options.  If the method fails, <i>pdwOptions</i> is set to BFO_NONE.
     * @param {Integer} dwMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions">BROWSERFRAMEOPTIONS</a></b>
     * 
     * Specifies the options requested as a bitwise combination of one or more of the constants of enumeration type <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions">BROWSERFRAMEOPTIONS</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions">BROWSERFRAMEOPTIONS</a>*</b>
     * 
     * When this method returns, contains the options that the view  can enable (for example, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> ). This value is not optional and is always equal to, or a subset of, the options specified by <i>dwMask</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibrowserframeoptions-getframeoptions
     */
    GetFrameOptions(dwMask) {
        result := ComCall(3, this, "uint", dwMask, "uint*", &pdwOptions := 0, "HRESULT")
        return pdwOptions
    }

    Query(iid) {
        if (IBrowserFrameOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFrameOptions := CallbackCreate(GetMethod(implObj, "GetFrameOptions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFrameOptions)
    }
}

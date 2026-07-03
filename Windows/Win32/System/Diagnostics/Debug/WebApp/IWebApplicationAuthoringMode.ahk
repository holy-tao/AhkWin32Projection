#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IServiceProvider.ahk" { IServiceProvider }

/**
 * Provides the full local path to the authoring binary to be loaded into the WWAHost process.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationauthoringmode
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationAuthoringMode extends IServiceProvider {
    /**
     * The interface identifier for IWebApplicationAuthoringMode
     * @type {Guid}
     */
    static IID := Guid("{720aea93-1964-4db0-b005-29eb9e2b18a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationAuthoringMode interfaces
    */
    struct Vtbl extends IServiceProvider.Vtbl {
        get_AuthoringClientBinary : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationAuthoringMode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    AuthoringClientBinary {
        get => this.get_AuthoringClientBinary()
    }

    /**
     * Gets the full local path to a DLL to be loaded into the WWAHost process.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationauthoringmode-get_authoringclientbinary
     */
    get_AuthoringClientBinary() {
        designModeDllPath := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, designModeDllPath, "HRESULT")
        return designModeDllPath
    }

    Query(iid) {
        if (IWebApplicationAuthoringMode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AuthoringClientBinary := CallbackCreate(GetMethod(implObj, "get_AuthoringClientBinary"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AuthoringClientBinary)
    }
}

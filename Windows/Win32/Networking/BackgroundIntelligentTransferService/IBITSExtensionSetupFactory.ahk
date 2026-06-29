#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBITSExtensionSetup.ahk" { IBITSExtensionSetup }

/**
 * Use the IBITSExtensionSetupFactory interface to get a pointer to the IBITSExtensionSetup interface.
 * @remarks
 * This interface is registered on the server when you install the BITS server extension.
 * 
 * On Windows Server 2003, use the <b>Windows Components Wizard</b> to install the BITS server extension. From  <b>Control Panel</b>, select <b>Add or Remove Programs</b>. Then, select <b>Add/Remove Windows Components</b> to display the <b>Windows Components Wizard</b>. The BITS server extension is a sub-component of Internet Information Services (IIS) which is a sub-component of Web Application Server.
 * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nn-bitscfg-ibitsextensionsetupfactory
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBITSExtensionSetupFactory extends IDispatch {
    /**
     * The interface identifier for IBITSExtensionSetupFactory
     * @type {Guid}
     */
    static IID := Guid("{d5d2d542-5503-4e64-8b48-72ef91a32ee1}")

    /**
     * The class identifier for BITSExtensionSetupFactory
     * @type {Guid}
     */
    static CLSID := Guid("{efbbab68-7286-4783-94bf-9461d8b7e7e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBITSExtensionSetupFactory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBITSExtensionSetupFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Use the GetObject method to retrieve a pointer to the IBITSExtensionSetup interface. This method performs the same binding that the ADsGetObject ADSI function performs.
     * @param {BSTR} _Path Null-terminated string containing the path to the directory service. For example, "IIS://&lt;machine name&gt;/w3svc/1/<i>virtual directory</i>".
     * @returns {IBITSExtensionSetup} Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bitscfg/nn-bitscfg-ibitsextensionsetup">IBITSExtensionSetup</a> interface to enable and disable BITS upload for the given virtual directory.
     * @see https://learn.microsoft.com/windows/win32/api/bitscfg/nf-bitscfg-ibitsextensionsetupfactory-getobject
     */
    GetObject(_Path) {
        _Path := _Path is String ? BSTR.Alloc(_Path).Value : _Path

        result := ComCall(7, this, BSTR, _Path, "ptr*", &ppExtensionSetup := 0, "HRESULT")
        return IBITSExtensionSetup(ppExtensionSetup)
    }

    Query(iid) {
        if (IBITSExtensionSetupFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObject)
    }
}

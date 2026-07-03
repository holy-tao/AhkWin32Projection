#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Data\Xml\MsXml\IXMLDOMDocument.ahk" { IXMLDOMDocument }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the XML DOM for an App Installer file.
 * @remarks
 * Get an instance of this interface by calling [IAppxFactory3::CreateAppInstallerReader](nf-appxpackaging-iappxfactory3-createappinstallerreader.md).
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxappinstallerreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxAppInstallerReader extends IUnknown {
    /**
     * The interface identifier for IAppxAppInstallerReader
     * @type {Guid}
     */
    static IID := Guid("{f35bc38c-1d2f-43db-a1f4-586430d1fed2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxAppInstallerReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetXmlDom : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxAppInstallerReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the XML DOM for an App Installer file.
     * @returns {IXMLDOMDocument} Receives a pointer to [IXMLDOMDocument](/previous-versions/windows/desktop/ms756987(v=vs.85)) representing the XML DOM for the App Installer file.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxappinstallerreader-getxmldom
     */
    GetXmlDom() {
        result := ComCall(3, this, "ptr*", &dom := 0, "HRESULT")
        return IXMLDOMDocument(dom)
    }

    Query(iid) {
        if (IAppxAppInstallerReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXmlDom := CallbackCreate(GetMethod(implObj, "GetXmlDom"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetXmlDom)
    }
}

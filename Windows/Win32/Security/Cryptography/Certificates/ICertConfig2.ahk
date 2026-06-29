#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ICertConfig.ahk" { ICertConfig }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provide functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/nn-certcli-icertconfig2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertConfig2 extends ICertConfig {
    /**
     * The interface identifier for ICertConfig2
     * @type {Guid}
     */
    static IID := Guid("{7a18edde-7e78-4163-8ded-78e2c9cee924}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertConfig2 interfaces
    */
    struct Vtbl extends ICertConfig.Vtbl {
        SetSharedFolder : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertConfig2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the path to be used as the certification authority's (CA) shared folder.
     * @param {BSTR} strSharedFolder String value that specifies the path of the new shared folder directory.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertconfig2-setsharedfolder
     */
    SetSharedFolder(strSharedFolder) {
        strSharedFolder := strSharedFolder is String ? BSTR.Alloc(strSharedFolder).Value : strSharedFolder

        result := ComCall(11, this, BSTR, strSharedFolder, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICertConfig2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSharedFolder := CallbackCreate(GetMethod(implObj, "SetSharedFolder"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSharedFolder)
    }
}

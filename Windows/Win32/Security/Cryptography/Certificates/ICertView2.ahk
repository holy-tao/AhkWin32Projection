#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CVRC_TABLE.ahk" { CVRC_TABLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertView.ahk" { ICertView }

/**
 * Allow properly authorized clients to create a customized or complete view of the Certificate Services database.
 * @see https://learn.microsoft.com/windows/win32/api/certview/nn-certview-icertview2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertView2 extends ICertView {
    /**
     * The interface identifier for ICertView2
     * @type {Guid}
     */
    static IID := Guid("{d594b282-8851-4b61-9c66-3edadf848863}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertView2 interfaces
    */
    struct Vtbl extends ICertView.Vtbl {
        SetTable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertView2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies which Certificate Services database table is used for subsequent calls to the methods of the ICertView2 interface.
     * @remarks
     * Before calling the <b>SetTable</b> method, it is necessary to establish a connection with a Certificate Services server by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">OpenConnection</a> method first. After the <b>OpenConnection</b> and <b>SetTable</b> calls are made, subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-icertview2">ICertView2</a> interface methods will use the Certificate Services database table specified by the <b>SetTable</b> method.
     * 
     * If the <b>SetTable</b> method is not called, then the default table  CVRC_TABLE_REQCERT is used.
     * @param {CVRC_TABLE} Table 
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview2-settable
     */
    SetTable(Table) {
        result := ComCall(15, this, CVRC_TABLE, Table, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICertView2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTable := CallbackCreate(GetMethod(implObj, "SetTable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTable)
    }
}

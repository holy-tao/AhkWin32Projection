#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AdrClientErrorType.ahk" { AdrClientErrorType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to show the Access Denied Remediation (ADR) client user interface.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmaccessdeniedremediationclient
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmAccessDeniedRemediationClient extends IDispatch {
    /**
     * The interface identifier for IFsrmAccessDeniedRemediationClient
     * @type {Guid}
     */
    static IID := Guid("{40002314-590b-45a5-8e1b-8c05da527e52}")

    /**
     * The class identifier for FsrmAccessDeniedRemediationClient
     * @type {Guid}
     */
    static CLSID := Guid("{100b4fc8-74c1-470f-b1b7-dd7b6bae79bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmAccessDeniedRemediationClient interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Show : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmAccessDeniedRemediationClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Displays the Access Denied Remediation (ADR) client dialog.
     * @param {Pointer} parentWnd Handle to the window that will be the parent of the dialog that will be displayed.
     * @param {BSTR} accessPath Path of the file being accessed.
     * @param {AdrClientErrorType} errorType The client error type as enumerated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-adrclienterrortype">AdrClientErrorType</a> enumeration.
     * @param {Integer} flags Reserved. Set to 0.
     * @param {BSTR} windowTitle Optional text to display as the title of the dialog window that is opened.
     * @param {BSTR} windowMessage Optional text to display above the instructions in the dialog window that is opened.
     * @returns {Integer} Address of a value that will receive a <b>HRESULT</b> containing the result of the 
     *       operation.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaccessdeniedremediationclient-show
     */
    Show(parentWnd, accessPath, errorType, flags, windowTitle, windowMessage) {
        accessPath := accessPath is String ? BSTR.Alloc(accessPath).Value : accessPath
        windowTitle := windowTitle is String ? BSTR.Alloc(windowTitle).Value : windowTitle
        windowMessage := windowMessage is String ? BSTR.Alloc(windowMessage).Value : windowMessage

        result := ComCall(7, this, "ptr", parentWnd, BSTR, accessPath, AdrClientErrorType, errorType, "int", flags, BSTR, windowTitle, BSTR, windowMessage, "int*", &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmAccessDeniedRemediationClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
    }
}

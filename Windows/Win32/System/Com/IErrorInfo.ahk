#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Provides detailed contextual error information.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ierrorinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct IErrorInfo extends IUnknown {
    /**
     * The interface identifier for IErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{1cf2b120-547d-101b-8e65-08002b2bd119}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IErrorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGUID        : IntPtr
        GetSource      : IntPtr
        GetDescription : IntPtr
        GetHelpFile    : IntPtr
        GetHelpContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the globally unique identifier (GUID) of the interface that defined the error.
     * @remarks
     * <b>IErrorInfo::GetGUID</b> returns the GUID of the interface that defined the error. If the error was defined by the system, <b>IErrorInfo::GetGUID</b> returns GUID_NULL.
     * 
     * 
     * 
     * This GUID does not necessarily represent the source of the error. The source is the class or application that raised the error. Using the GUID, an application can handle errors in an interface, independent of the class that implements the interface.
     * @returns {Guid} A pointer to a GUID, or GUID_NULL, if the error was defined by the operating system.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getguid
     */
    GetGUID() {
        pGUID := Guid()
        result := ComCall(3, this, Guid.Ptr, pGUID, "HRESULT")
        return pGUID
    }

    /**
     * Returns the language-dependent programmatic ID (ProgID) for the class or application that raised the error.
     * @remarks
     * Use <b>IErrorInfo::GetSource</b> to determine the class or application that is the source of the error. The language for the returned ProgID depends on the locale ID (LCID) that was passed into the method at the time of invocation.
     * @returns {BSTR} A ProgID, in the form <i>progname</i>.<i>objectname</i>.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getsource
     */
    GetSource() {
        pBstrSource := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pBstrSource, "HRESULT")
        return pBstrSource
    }

    /**
     * Returns a textual description of the error.
     * @remarks
     * The text is returned in the language specified by the locale identifier (LCID) that was passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> for the method that encountered the error.
     * @returns {BSTR} A brief description of the error.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getdescription
     */
    GetDescription() {
        pBstrDescription := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pBstrDescription, "HRESULT")
        return pBstrDescription
    }

    /**
     * Returns the path of the Help file that describes the error.
     * @remarks
     * This method returns the fully qualified path of the Help file that describes the current error. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-ierrorinfo-gethelpcontext">IErrorInfo::GetHelpContext</a> should be used to find the Help context ID for the error in the Help file.
     * @returns {BSTR} The fully qualified path of the Help file.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-gethelpfile
     */
    GetHelpFile() {
        pBstrHelpFile := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pBstrHelpFile, "HRESULT")
        return pBstrHelpFile
    }

    /**
     * Returns the Help context identifier (ID) for the error.
     * @remarks
     * This method returns the Help context ID for the error. To find the Help file to which it applies, use <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/nf-oaidl-ierrorinfo-gethelpfile">IErrorInfo::GetHelpFile</a>.
     * @returns {Integer} The Help context ID for the error.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-gethelpcontext
     */
    GetHelpContext() {
        result := ComCall(7, this, "uint*", &pdwHelpContext := 0, "HRESULT")
        return pdwHelpContext
    }

    Query(iid) {
        if (IErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGUID := CallbackCreate(GetMethod(implObj, "GetGUID"), flags, 2)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetHelpFile := CallbackCreate(GetMethod(implObj, "GetHelpFile"), flags, 2)
        this.vtbl.GetHelpContext := CallbackCreate(GetMethod(implObj, "GetHelpContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGUID)
        CallbackFree(this.vtbl.GetSource)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetHelpFile)
        CallbackFree(this.vtbl.GetHelpContext)
    }
}

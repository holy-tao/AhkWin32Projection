#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUnknown.ahk

/**
 * Provides detailed contextual error information.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ierrorinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{1cf2b120-547d-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGUID", "GetSource", "GetDescription", "GetHelpFile", "GetHelpContext"]

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
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
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
        pBstrSource := BSTR()
        result := ComCall(4, this, "ptr", pBstrSource, "HRESULT")
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
        pBstrDescription := BSTR()
        result := ComCall(5, this, "ptr", pBstrDescription, "HRESULT")
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
        pBstrHelpFile := BSTR()
        result := ComCall(6, this, "ptr", pBstrHelpFile, "HRESULT")
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
}

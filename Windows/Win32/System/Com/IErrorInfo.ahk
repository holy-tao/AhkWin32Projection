#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUnknown.ahk

/**
 * Provides detailed contextual error information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ierrorinfo
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
     * @returns {Guid} A pointer to a GUID, or GUID_NULL, if the error was defined by the operating system.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ierrorinfo-getguid
     */
    GetGUID() {
        pGUID := Guid()
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
        return pGUID
    }

    /**
     * Returns the language-dependent programmatic ID (ProgID) for the class or application that raised the error.
     * @returns {BSTR} A ProgID, in the form <i>progname</i>.<i>objectname</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ierrorinfo-getsource
     */
    GetSource() {
        pBstrSource := BSTR()
        result := ComCall(4, this, "ptr", pBstrSource, "HRESULT")
        return pBstrSource
    }

    /**
     * Returns a textual description of the error.
     * @returns {BSTR} A brief description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ierrorinfo-getdescription
     */
    GetDescription() {
        pBstrDescription := BSTR()
        result := ComCall(5, this, "ptr", pBstrDescription, "HRESULT")
        return pBstrDescription
    }

    /**
     * Returns the path of the Help file that describes the error.
     * @returns {BSTR} The fully qualified path of the Help file.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ierrorinfo-gethelpfile
     */
    GetHelpFile() {
        pBstrHelpFile := BSTR()
        result := ComCall(6, this, "ptr", pBstrHelpFile, "HRESULT")
        return pBstrHelpFile
    }

    /**
     * Returns the Help context identifier (ID) for the error.
     * @returns {Integer} The Help context ID for the error.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-ierrorinfo-gethelpcontext
     */
    GetHelpContext() {
        result := ComCall(7, this, "uint*", &pdwHelpContext := 0, "HRESULT")
        return pdwHelpContext
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to show the Access Denied Remediation (ADR) client user interface.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmaccessdeniedremediationclient
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmAccessDeniedRemediationClient extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmAccessDeniedRemediationClient
     * @type {Guid}
     */
    static IID => Guid("{40002314-590b-45a5-8e1b-8c05da527e52}")

    /**
     * The class identifier for FsrmAccessDeniedRemediationClient
     * @type {Guid}
     */
    static CLSID => Guid("{100b4fc8-74c1-470f-b1b7-dd7b6bae79bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show"]

    /**
     * Displays the Access Denied Remediation (ADR) client dialog.
     * @param {Pointer} parentWnd Handle to the window that will be the parent of the dialog that will be displayed.
     * @param {BSTR} accessPath Path of the file being accessed.
     * @param {Integer} errorType The client error type as enumerated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-adrclienterrortype">AdrClientErrorType</a> enumeration.
     * @param {Integer} flags Reserved. Set to 0.
     * @param {BSTR} windowTitle Optional text to display as the title of the dialog window that is opened.
     * @param {BSTR} windowMessage Optional text to display above the instructions in the dialog window that is opened.
     * @returns {Integer} Address of a value that will receive a <b>HRESULT</b> containing the result of the 
     *       operation.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmaccessdeniedremediationclient-show
     */
    Show(parentWnd, accessPath, errorType, flags, windowTitle, windowMessage) {
        accessPath := accessPath is String ? BSTR.Alloc(accessPath).Value : accessPath
        windowTitle := windowTitle is String ? BSTR.Alloc(windowTitle).Value : windowTitle
        windowMessage := windowMessage is String ? BSTR.Alloc(windowMessage).Value : windowMessage

        result := ComCall(7, this, "ptr", parentWnd, "ptr", accessPath, "int", errorType, "int", flags, "ptr", windowTitle, "ptr", windowMessage, "int*", &result := 0, "HRESULT")
        return result
    }
}

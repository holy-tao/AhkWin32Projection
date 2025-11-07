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
     * 
     * @param {Pointer} parentWnd 
     * @param {BSTR} accessPath 
     * @param {Integer} errorType 
     * @param {Integer} flags 
     * @param {BSTR} windowTitle 
     * @param {BSTR} windowMessage 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaccessdeniedremediationclient-show
     */
    Show(parentWnd, accessPath, errorType, flags, windowTitle, windowMessage) {
        accessPath := accessPath is String ? BSTR.Alloc(accessPath).Value : accessPath
        windowTitle := windowTitle is String ? BSTR.Alloc(windowTitle).Value : windowTitle
        windowMessage := windowMessage is String ? BSTR.Alloc(windowMessage).Value : windowMessage

        result := ComCall(7, this, "ptr", parentWnd, "ptr", accessPath, "int", errorType, "int", flags, "ptr", windowTitle, "ptr", windowMessage, "int*", &result := 0, "HRESULT")
        return result
    }
}

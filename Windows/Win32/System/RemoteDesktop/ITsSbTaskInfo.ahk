#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes properties that the Remote Desktop Connection Broker uses to set a plugin’s queue.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtaskinfo
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTaskInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbTaskInfo
     * @type {Guid}
     */
    static IID => Guid("{523d1083-89be-48dd-99ea-04e82ffa7265}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetId", "get_StartTime", "get_EndTime", "get_Deadline", "get_Identifier", "get_Label", "get_Context", "get_Plugin", "get_Status"]

    /**
     * @type {BSTR} 
     */
    TargetId {
        get => this.get_TargetId()
    }

    /**
     * @type {FILETIME} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {FILETIME} 
     */
    EndTime {
        get => this.get_EndTime()
    }

    /**
     * @type {FILETIME} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * @type {BSTR} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * @type {BSTR} 
     */
    Label {
        get => this.get_Label()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * @type {BSTR} 
     */
    Plugin {
        get => this.get_Plugin()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_targetid
     */
    get_TargetId() {
        pName := BSTR()
        result := ComCall(3, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_starttime
     */
    get_StartTime() {
        pStartTime := FILETIME()
        result := ComCall(4, this, "ptr", pStartTime, "HRESULT")
        return pStartTime
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_endtime
     */
    get_EndTime() {
        pEndTime := FILETIME()
        result := ComCall(5, this, "ptr", pEndTime, "HRESULT")
        return pEndTime
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_deadline
     */
    get_Deadline() {
        pDeadline := FILETIME()
        result := ComCall(6, this, "ptr", pDeadline, "HRESULT")
        return pDeadline
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_identifier
     */
    get_Identifier() {
        pIdentifier := BSTR()
        result := ComCall(7, this, "ptr", pIdentifier, "HRESULT")
        return pIdentifier
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_label
     */
    get_Label() {
        pLabel := BSTR()
        result := ComCall(8, this, "ptr", pLabel, "HRESULT")
        return pLabel
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_context
     */
    get_Context() {
        result := ComCall(9, this, "ptr*", &pContext := 0, "HRESULT")
        return pContext
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_plugin
     */
    get_Plugin() {
        pPlugin := BSTR()
        result := ComCall(10, this, "ptr", pPlugin, "HRESULT")
        return pPlugin
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbtaskinfo-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRDPSRAPIApplication.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a one-to-one mapping to a sharable window.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiwindow
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIWindow extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIWindow
     * @type {Guid}
     */
    static IID => Guid("{beafe0f9-c77b-4933-ba9f-a24cddcc27cf}")

    /**
     * The class identifier for RDPSRAPIWindow
     * @type {Guid}
     */
    static CLSID => Guid("{03cf46db-ce45-4d36-86ed-ed28b74398bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Application", "get_Shared", "put_Shared", "get_Name", "Show", "get_Flags"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IRDPSRAPIApplication} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Shared {
        get => this.get_Shared()
        set => this.put_Shared(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * Returns the ID of a window.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Returns a pointer to the application object that the window belongs to.
     * @returns {IRDPSRAPIApplication} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_application
     */
    get_Application() {
        result := ComCall(8, this, "ptr*", &pApplication := 0, "HRESULT")
        return IRDPSRAPIApplication(pApplication)
    }

    /**
     * Gets or sets the sharing property for a window.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_shared
     */
    get_Shared() {
        result := ComCall(9, this, "short*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Gets or sets the sharing property for a window.
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-put_shared
     */
    put_Shared(NewVal) {
        result := ComCall(10, this, "short", NewVal, "HRESULT")
        return result
    }

    /**
     * Returns the name for the window object.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_name
     */
    get_Name() {
        pRetVal := BSTR()
        result := ComCall(11, this, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Brings the current window to the foreground.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-show
     */
    Show() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Returns the flags on the current window.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_flags
     */
    get_Flags() {
        result := ComCall(13, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}

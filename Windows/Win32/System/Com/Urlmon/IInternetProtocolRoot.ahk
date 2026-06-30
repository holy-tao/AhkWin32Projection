#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetBindInfo.ahk
#Include .\PROTOCOLDATA.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\IInternetProtocolSink.ahk
#Include ..\..\..\Foundation\HRESULT.ahk
#Include ..\..\..\Foundation\HANDLE_PTR.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class IInternetProtocolRoot extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolRoot
     * @type {Guid}
     */
    static IID => Guid("{79eac9e3-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Continue", "Abort", "Terminate", "Suspend", "Resume"]

    /**
     * 
     * @param {PWSTR} szUrl 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @param {IInternetBindInfo} pOIBindInfo 
     * @param {Integer} grfPI 
     * @param {HANDLE_PTR} dwReserved 
     * @returns {HRESULT} 
     */
    Start(szUrl, pOIProtSink, pOIBindInfo, grfPI, dwReserved) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(3, this, "ptr", szUrl, "ptr", pOIProtSink, "ptr", pOIBindInfo, "uint", grfPI, "ptr", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROTOCOLDATA>} pProtocolData 
     * @returns {HRESULT} 
     */
    Continue(pProtocolData) {
        result := ComCall(4, this, "ptr", pProtocolData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrReason 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    Abort(hrReason, dwOptions) {
        result := ComCall(5, this, "int", hrReason, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    Terminate(dwOptions) {
        result := ComCall(6, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Suspend() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the specified computer. This information is relevant to the Windows Update Agent (WUA).
 * @remarks
 * 
 * You can create an instance of this interface by using the SystemInformation coclass. Use the Microsoft.Update.SystemInfo program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-isysteminformation
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ISystemInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemInformation
     * @type {Guid}
     */
    static IID => Guid("{ade87bf7-7b56-4275-8fab-b9b0e591844b}")

    /**
     * The class identifier for SystemInformation
     * @type {Guid}
     */
    static CLSID => Guid("{c01b9ba0-bea7-41ba-b604-d0a36f469133}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OemHardwareSupportLink", "get_RebootRequired"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isysteminformation-get_oemhardwaresupportlink
     */
    get_OemHardwareSupportLink() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isysteminformation-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}

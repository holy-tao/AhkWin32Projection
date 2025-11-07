#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the version of Windows Update Agent (WUA).
 * @remarks
 * 
 * The <b>IWindowsUpdateAgentInfo</b> interface  may require  you to update WUA. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * 
 * You can create an instance of this interface by using the WindowsUpdateAgentInfo coclass. Use the Microsoft.Update.AgentInfo program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsupdateagentinfo
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsUpdateAgentInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateAgentInfo
     * @type {Guid}
     */
    static IID => Guid("{85713fa1-7796-4fa2-be3b-e2d6124dd373}")

    /**
     * The class identifier for WindowsUpdateAgentInfo
     * @type {Guid}
     */
    static CLSID => Guid("{c2e88c2f-6f5b-4aaa-894b-55c847ad3a2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo"]

    /**
     * 
     * @param {VARIANT} varInfoIdentifier 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsupdateagentinfo-getinfo
     */
    GetInfo(varInfoIdentifier) {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", varInfoIdentifier, "ptr", retval, "HRESULT")
        return retval
    }
}

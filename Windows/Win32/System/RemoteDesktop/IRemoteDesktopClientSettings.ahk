#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods needed to configure the connection settings for the Remote Desktop Protocol (RDP) app container client control.
 * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclientsettings
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IRemoteDesktopClientSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDesktopClientSettings
     * @type {Guid}
     */
    static IID => Guid("{48a0f2a7-2713-431f-bbac-6f4558e7d64d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplySettings", "RetrieveSettings", "GetRdpProperty", "SetRdpProperty"]

    /**
     * 
     * @param {BSTR} rdpFileContents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-applysettings
     */
    ApplySettings(rdpFileContents) {
        rdpFileContents := rdpFileContents is String ? BSTR.Alloc(rdpFileContents).Value : rdpFileContents

        result := ComCall(7, this, "ptr", rdpFileContents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} rdpFileContents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-retrievesettings
     */
    RetrieveSettings(rdpFileContents) {
        result := ComCall(8, this, "ptr", rdpFileContents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-getrdpproperty
     */
    GetRdpProperty(propertyName, value) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(9, this, "ptr", propertyName, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-setrdpproperty
     */
    SetRdpProperty(propertyName, value) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(10, this, "ptr", propertyName, "ptr", value, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods needed to configure the connection settings for the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclientsettings
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
     * Stores the specified contents in the RDP file.
     * @param {BSTR} rdpFileContents Specifies the entire contents of the RDP file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-applysettings
     */
    ApplySettings(rdpFileContents) {
        if(rdpFileContents is String) {
            pin := BSTR.Alloc(rdpFileContents)
            rdpFileContents := pin.Value
        }

        result := ComCall(7, this, "ptr", rdpFileContents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the entire RDP file as a string.
     * @returns {BSTR} The entire contents of the RDP file.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-retrievesettings
     */
    RetrieveSettings() {
        rdpFileContents := BSTR()
        result := ComCall(8, this, "ptr", rdpFileContents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return rdpFileContents
    }

    /**
     * Retrieves a single named RDP property value.
     * @param {BSTR} propertyName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-getrdpproperty
     */
    GetRdpProperty(propertyName) {
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        value := VARIANT()
        result := ComCall(9, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the value of a single named RDP property.
     * @param {BSTR} propertyName A string that specifies the name of the property.
     * 
     * <div class="alert"><b>Note</b>  These string values are not case-sensitive.</div>
     * <div> </div>
     * 
     * The possible values are.
     * @param {VARIANT} value The new property value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-setrdpproperty
     */
    SetRdpProperty(propertyName, value) {
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        result := ComCall(10, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

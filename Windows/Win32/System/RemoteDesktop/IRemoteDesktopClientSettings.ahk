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
     * 
     * @param {BSTR} rdpFileContents 
     * @returns {HRESULT} 
     */
    ApplySettings(rdpFileContents) {
        rdpFileContents := rdpFileContents is String ? BSTR.Alloc(rdpFileContents).Value : rdpFileContents

        result := ComCall(7, this, "ptr", rdpFileContents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} rdpFileContents 
     * @returns {HRESULT} 
     */
    RetrieveSettings(rdpFileContents) {
        result := ComCall(8, this, "ptr", rdpFileContents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetRdpProperty(propertyName, value) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(9, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    SetRdpProperty(propertyName, value) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(10, this, "ptr", propertyName, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

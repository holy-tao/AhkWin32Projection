#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\IVpnProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnManagementAgent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnManagementAgent
     * @type {Guid}
     */
    static IID => Guid("{193696cd-a5c4-4abe-852b-785be4cb3e34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddProfileFromXmlAsync", "AddProfileFromObjectAsync", "UpdateProfileFromXmlAsync", "UpdateProfileFromObjectAsync", "GetProfilesAsync", "DeleteProfileAsync", "ConnectProfileAsync", "ConnectProfileWithPasswordCredentialAsync", "DisconnectProfileAsync"]

    /**
     * 
     * @param {HSTRING} xml 
     * @returns {IAsyncOperation<Integer>} 
     */
    AddProfileFromXmlAsync(xml) {
        if(xml is String) {
            pin := HSTRING.Create(xml)
            xml := pin.Value
        }
        xml := xml is Win32Handle ? NumGet(xml, "ptr") : xml

        result := ComCall(6, this, "ptr", xml, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IVpnProfile} profile_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    AddProfileFromObjectAsync(profile_) {
        result := ComCall(7, this, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} xml 
     * @returns {IAsyncOperation<Integer>} 
     */
    UpdateProfileFromXmlAsync(xml) {
        if(xml is String) {
            pin := HSTRING.Create(xml)
            xml := pin.Value
        }
        xml := xml is Win32Handle ? NumGet(xml, "ptr") : xml

        result := ComCall(8, this, "ptr", xml, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IVpnProfile} profile_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    UpdateProfileFromObjectAsync(profile_) {
        result := ComCall(9, this, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<IVpnProfile>>} 
     */
    GetProfilesAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IVpnProfile), operation)
    }

    /**
     * 
     * @param {IVpnProfile} profile_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    DeleteProfileAsync(profile_) {
        result := ComCall(11, this, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IVpnProfile} profile_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    ConnectProfileAsync(profile_) {
        result := ComCall(12, this, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IVpnProfile} profile_ 
     * @param {PasswordCredential} passwordCredential_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    ConnectProfileWithPasswordCredentialAsync(profile_, passwordCredential_) {
        result := ComCall(13, this, "ptr", profile_, "ptr", passwordCredential_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {IVpnProfile} profile_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    DisconnectProfileAsync(profile_) {
        result := ComCall(14, this, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}

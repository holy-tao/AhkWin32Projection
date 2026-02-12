#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ProvisionFromXmlDocumentResults.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProvisionedProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IProvisioningAgent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvisioningAgent
     * @type {Guid}
     */
    static IID => Guid("{217700e0-8201-11df-adb9-f4ce462d9137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProvisionFromXmlDocumentAsync", "GetProvisionedProfile"]

    /**
     * 
     * @param {HSTRING} provisioningXmlDocument 
     * @returns {IAsyncOperation<ProvisionFromXmlDocumentResults>} 
     */
    ProvisionFromXmlDocumentAsync(provisioningXmlDocument) {
        if(provisioningXmlDocument is String) {
            pin := HSTRING.Create(provisioningXmlDocument)
            provisioningXmlDocument := pin.Value
        }
        provisioningXmlDocument := provisioningXmlDocument is Win32Handle ? NumGet(provisioningXmlDocument, "ptr") : provisioningXmlDocument

        result := ComCall(6, this, "ptr", provisioningXmlDocument, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ProvisionFromXmlDocumentResults, asyncInfo)
    }

    /**
     * 
     * @param {Integer} mediaType_ 
     * @param {HSTRING} profileName 
     * @returns {ProvisionedProfile} 
     */
    GetProvisionedProfile(mediaType_, profileName) {
        if(profileName is String) {
            pin := HSTRING.Create(profileName)
            profileName := pin.Value
        }
        profileName := profileName is Win32Handle ? NumGet(profileName, "ptr") : profileName

        result := ComCall(7, this, "int", mediaType_, "ptr", profileName, "ptr*", &provisionedProfile_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProvisionedProfile(provisionedProfile_)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PlayReadyContentHeader.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyContentHeaderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyContentHeaderFactory
     * @type {Guid}
     */
    static IID => Guid("{cb97c8ff-b758-4776-bf01-217a8b510b2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceFromWindowsMediaDrmHeader", "CreateInstanceFromComponents", "CreateInstanceFromPlayReadyHeader"]

    /**
     * 
     * @param {Integer} headerBytes_length 
     * @param {Pointer<Integer>} headerBytes 
     * @param {Uri} licenseAcquisitionUrl 
     * @param {Uri} licenseAcquisitionUserInterfaceUrl 
     * @param {HSTRING} customAttributes 
     * @param {Guid} domainServiceId 
     * @returns {PlayReadyContentHeader} 
     */
    CreateInstanceFromWindowsMediaDrmHeader(headerBytes_length, headerBytes, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId) {
        if(customAttributes is String) {
            pin := HSTRING.Create(customAttributes)
            customAttributes := pin.Value
        }
        customAttributes := customAttributes is Win32Handle ? NumGet(customAttributes, "ptr") : customAttributes

        headerBytesMarshal := headerBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", headerBytes_length, headerBytesMarshal, headerBytes, "ptr", licenseAcquisitionUrl, "ptr", licenseAcquisitionUserInterfaceUrl, "ptr", customAttributes, "ptr", domainServiceId, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyContentHeader(instance)
    }

    /**
     * 
     * @param {Guid} contentKeyId 
     * @param {HSTRING} contentKeyIdString 
     * @param {Integer} contentEncryptionAlgorithm 
     * @param {Uri} licenseAcquisitionUrl 
     * @param {Uri} licenseAcquisitionUserInterfaceUrl 
     * @param {HSTRING} customAttributes 
     * @param {Guid} domainServiceId 
     * @returns {PlayReadyContentHeader} 
     */
    CreateInstanceFromComponents(contentKeyId, contentKeyIdString, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId) {
        if(contentKeyIdString is String) {
            pin := HSTRING.Create(contentKeyIdString)
            contentKeyIdString := pin.Value
        }
        contentKeyIdString := contentKeyIdString is Win32Handle ? NumGet(contentKeyIdString, "ptr") : contentKeyIdString
        if(customAttributes is String) {
            pin := HSTRING.Create(customAttributes)
            customAttributes := pin.Value
        }
        customAttributes := customAttributes is Win32Handle ? NumGet(customAttributes, "ptr") : customAttributes

        result := ComCall(7, this, "ptr", contentKeyId, "ptr", contentKeyIdString, "int", contentEncryptionAlgorithm, "ptr", licenseAcquisitionUrl, "ptr", licenseAcquisitionUserInterfaceUrl, "ptr", customAttributes, "ptr", domainServiceId, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyContentHeader(instance)
    }

    /**
     * 
     * @param {Integer} headerBytes_length 
     * @param {Pointer<Integer>} headerBytes 
     * @returns {PlayReadyContentHeader} 
     */
    CreateInstanceFromPlayReadyHeader(headerBytes_length, headerBytes) {
        headerBytesMarshal := headerBytes is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", headerBytes_length, headerBytesMarshal, headerBytes, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyContentHeader(instance)
    }
}

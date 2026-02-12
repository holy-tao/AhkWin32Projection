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
class IPlayReadyContentHeaderFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyContentHeaderFactory2
     * @type {Guid}
     */
    static IID => Guid("{d1239cf5-ae6d-4778-97fd-6e3a2eeadbeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceFromComponents2"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} contentKeyIds_length 
     * @param {Pointer<Guid>} contentKeyIds 
     * @param {Integer} contentKeyIdStrings_length 
     * @param {Pointer<HSTRING>} contentKeyIdStrings 
     * @param {Integer} contentEncryptionAlgorithm 
     * @param {Uri} licenseAcquisitionUrl 
     * @param {Uri} licenseAcquisitionUserInterfaceUrl 
     * @param {HSTRING} customAttributes 
     * @param {Guid} domainServiceId 
     * @returns {PlayReadyContentHeader} 
     */
    CreateInstanceFromComponents2(dwFlags, contentKeyIds_length, contentKeyIds, contentKeyIdStrings_length, contentKeyIdStrings, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId) {
        if(customAttributes is String) {
            pin := HSTRING.Create(customAttributes)
            customAttributes := pin.Value
        }
        customAttributes := customAttributes is Win32Handle ? NumGet(customAttributes, "ptr") : customAttributes

        result := ComCall(6, this, "uint", dwFlags, "uint", contentKeyIds_length, "ptr", contentKeyIds, "uint", contentKeyIdStrings_length, "ptr", contentKeyIdStrings, "int", contentEncryptionAlgorithm, "ptr", licenseAcquisitionUrl, "ptr", licenseAcquisitionUserInterfaceUrl, "ptr", customAttributes, "ptr", domainServiceId, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyContentHeader(instance)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers providers with VDS.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdsadmin
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdmin extends IUnknown{
    /**
     * The interface identifier for IVdsAdmin
     * @type {Guid}
     */
    static IID => Guid("{d188e97d-85aa-4d33-abc6-26299a10ffc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} providerId 
     * @param {Pointer<Guid>} providerClsid 
     * @param {PWSTR} pwszName 
     * @param {Integer} type 
     * @param {PWSTR} pwszMachineName 
     * @param {PWSTR} pwszVersion 
     * @param {Pointer<Guid>} guidVersionId 
     * @returns {HRESULT} 
     */
    RegisterProvider(providerId, providerClsid, pwszName, type, pwszMachineName, pwszVersion, guidVersionId) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion

        result := ComCall(3, this, "ptr", providerId, "ptr", providerClsid, "ptr", pwszName, "int", type, "ptr", pwszMachineName, "ptr", pwszVersion, "ptr", guidVersionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} providerId 
     * @returns {HRESULT} 
     */
    UnregisterProvider(providerId) {
        result := ComCall(4, this, "ptr", providerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

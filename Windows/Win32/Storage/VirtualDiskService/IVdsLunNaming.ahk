#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to name LUNs for a class implementing the IVdsLun interface.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslunnaming
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunNaming extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunNaming
     * @type {Guid}
     */
    static IID => Guid("{907504cb-6b4e-4d88-a34d-17ba661fbb06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFriendlyName"]

    /**
     * 
     * @param {PWSTR} pwszFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunnaming-setfriendlyname
     */
    SetFriendlyName(pwszFriendlyName) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(3, this, "ptr", pwszFriendlyName, "HRESULT")
        return result
    }
}

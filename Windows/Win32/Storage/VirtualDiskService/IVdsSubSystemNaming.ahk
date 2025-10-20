#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to name subsystems for a class implementing the IVdsSubSystem interface.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystemnaming
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystemNaming extends IUnknown{
    /**
     * The interface identifier for IVdsSubSystemNaming
     * @type {Guid}
     */
    static IID => Guid("{0d70faa3-9cd4-4900-aa20-6981b6aafc75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszFriendlyName 
     * @returns {HRESULT} 
     */
    SetFriendlyName(pwszFriendlyName) {
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(3, this, "ptr", pwszFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

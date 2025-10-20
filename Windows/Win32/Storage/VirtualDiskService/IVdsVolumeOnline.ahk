#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to repair single volumes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumeonline
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeOnline extends IUnknown{
    /**
     * The interface identifier for IVdsVolumeOnline
     * @type {Guid}
     */
    static IID => Guid("{1be2275a-b315-4f70-9e44-879b3a2a53f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Online() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents a source provider that supports filtered change enumeration, and that can negotiate the type of filter that is used.
 * @remarks
 * 
  * <b>ISupportFilteredSync</b> is typically implemented by a source provider.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isupportfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISupportFilteredSync extends IUnknown{
    /**
     * The interface identifier for ISupportFilteredSync
     * @type {Guid}
     */
    static IID => Guid("{3d128ded-d555-4e0d-bf4b-fb213a8a9302}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pFilter 
     * @param {Integer} filteringType 
     * @returns {HRESULT} 
     */
    AddFilter(pFilter, filteringType) {
        result := ComCall(3, this, "ptr", pFilter, "int", filteringType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

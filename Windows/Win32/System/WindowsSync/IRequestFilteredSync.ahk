#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents a destination provider that can specify a filter to be used by the source provider during change enumeration.
 * @remarks
 * 
  * Typically, <b>IRequestFilteredSync</b> is implemented by a destination provider.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irequestfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRequestFilteredSync extends IUnknown{
    /**
     * The interface identifier for IRequestFilteredSync
     * @type {Guid}
     */
    static IID => Guid("{2e020184-6d18-46a7-a32a-da4aeb06696c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IFilterRequestCallback>} pCallback 
     * @returns {HRESULT} 
     */
    SpecifyFilter(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

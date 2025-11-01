#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGetCapabilitiesKey interface enables an application to retrieve the capabilities of a software or hardware codec from the registry, without creating an instance of the encoder filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igetcapabilitieskey
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGetCapabilitiesKey extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetCapabilitiesKey
     * @type {Guid}
     */
    static IID => Guid("{a8809222-07bb-48ea-951c-33158100625b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilitiesKey"]

    /**
     * 
     * @param {Pointer<HKEY>} pHKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igetcapabilitieskey-getcapabilitieskey
     */
    GetCapabilitiesKey(pHKey) {
        result := ComCall(3, this, "ptr", pHKey, "HRESULT")
        return result
    }
}

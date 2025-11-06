#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPlayerTimestampHook interface is implemented on a player's source filter.
 * @see https://docs.microsoft.com/windows/win32/api//wmdxva/nn-wmdxva-iwmplayertimestamphook
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPlayerTimestampHook extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPlayerTimestampHook
     * @type {Guid}
     */
    static IID => Guid("{28580dda-d98e-48d0-b7ae-69e473a02825}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapTimestamp"]

    /**
     * 
     * @param {Integer} rtIn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmplayertimestamphook-maptimestamp
     */
    MapTimestamp(rtIn) {
        result := ComCall(3, this, "int64", rtIn, "int64*", &prtOut := 0, "HRESULT")
        return prtOut
    }
}

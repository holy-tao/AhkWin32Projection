#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method for getting the default Desk Band bandwidth.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ideskbandinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDeskBandInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeskBandInfo
     * @type {Guid}
     */
    static IID => Guid("{77e425fc-cbf9-4307-ba6a-bb5727745661}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultBandWidth"]

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Integer} dwViewMode 
     * @param {Pointer<Integer>} pnWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskbandinfo-getdefaultbandwidth
     */
    GetDefaultBandWidth(dwBandID, dwViewMode, pnWidth) {
        result := ComCall(3, this, "uint", dwBandID, "uint", dwViewMode, "int*", pnWidth, "HRESULT")
        return result
    }
}

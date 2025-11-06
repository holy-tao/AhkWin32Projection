#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that determines the sector size as an aid to byte alignment.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-istreamunbufferedinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStreamUnbufferedInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamUnbufferedInfo
     * @type {Guid}
     */
    static IID => Guid("{8a68fdda-1fdc-4c20-8ceb-416643b5a625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSectorSize"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamunbufferedinfo-getsectorsize
     */
    GetSectorSize() {
        result := ComCall(3, this, "uint*", &pcbSectorSize := 0, "HRESULT")
        return pcbSectorSize
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Repairs a corrupted .WTV file.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2FileScan)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2filescan
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2FileScan extends IUnknown{
    /**
     * The interface identifier for ISBE2FileScan
     * @type {Guid}
     */
    static IID => Guid("{3e2bf5a5-4f96-4899-a1a3-75e8be9a5ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} filename 
     * @returns {HRESULT} 
     */
    RepairFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(3, this, "ptr", filename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

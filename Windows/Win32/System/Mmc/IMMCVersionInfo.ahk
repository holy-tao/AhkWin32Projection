#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IMMCVersionInfo interface provides version information about the installed MMC application.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-immcversioninfo
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IMMCVersionInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMCVersionInfo
     * @type {Guid}
     */
    static IID => Guid("{a8d2c5fe-cdcb-4b9d-bde5-a27343ff54bc}")

    /**
     * The class identifier for MMCVersionInfo
     * @type {Guid}
     */
    static CLSID => Guid("{d6fedb1d-cf21-4bd9-af3b-c5468e9c6684}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMMCVersion"]

    /**
     * 
     * @param {Pointer<Integer>} pVersionMajor 
     * @param {Pointer<Integer>} pVersionMinor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-immcversioninfo-getmmcversion
     */
    GetMMCVersion(pVersionMajor, pVersionMinor) {
        pVersionMajorMarshal := pVersionMajor is VarRef ? "int*" : "ptr"
        pVersionMinorMarshal := pVersionMinor is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pVersionMajorMarshal, pVersionMajor, pVersionMinorMarshal, pVersionMinor, "HRESULT")
        return result
    }
}

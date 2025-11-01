#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IGameStatisticsMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameStatisticsMgr
     * @type {Guid}
     */
    static IID => Guid("{aff3ea11-e70e-407d-95dd-35e612c41ce2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGameStatistics", "RemoveGameStatistics"]

    /**
     * 
     * @param {PWSTR} GDFBinaryPath 
     * @param {Integer} openType 
     * @param {Pointer<Integer>} pOpenResult 
     * @param {Pointer<IGameStatistics>} ppiStats 
     * @returns {HRESULT} 
     */
    GetGameStatistics(GDFBinaryPath, openType, pOpenResult, ppiStats) {
        GDFBinaryPath := GDFBinaryPath is String ? StrPtr(GDFBinaryPath) : GDFBinaryPath

        result := ComCall(3, this, "ptr", GDFBinaryPath, "int", openType, "int*", pOpenResult, "ptr*", ppiStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} GDFBinaryPath 
     * @returns {HRESULT} 
     */
    RemoveGameStatistics(GDFBinaryPath) {
        GDFBinaryPath := GDFBinaryPath is String ? StrPtr(GDFBinaryPath) : GDFBinaryPath

        result := ComCall(4, this, "ptr", GDFBinaryPath, "HRESULT")
        return result
    }
}

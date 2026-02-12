#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\HolographicFrameScanoutReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFrameScanoutMonitor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFrameScanoutMonitor
     * @type {Guid}
     */
    static IID => Guid("{7e83efa9-843c-5401-8095-9bc1b8b08638}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadReports"]

    /**
     * 
     * @returns {IVector<HolographicFrameScanoutReport>} 
     */
    ReadReports() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HolographicFrameScanoutReport, result_)
    }
}

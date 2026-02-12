#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\HolographicFramePresentationReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicFramePresentationMonitor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicFramePresentationMonitor
     * @type {Guid}
     */
    static IID => Guid("{ca87256c-6fae-428e-bb83-25dfee51136b}")

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
     * @returns {IVectorView<HolographicFramePresentationReport>} 
     */
    ReadReports() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HolographicFramePresentationReport, result_)
    }
}

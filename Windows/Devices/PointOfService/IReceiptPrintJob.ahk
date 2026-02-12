#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IReceiptPrintJob extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReceiptPrintJob
     * @type {Guid}
     */
    static IID => Guid("{aa96066e-acad-4b79-9d0f-c0cfc08dc77b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MarkFeed", "CutPaper", "CutPaperDefault"]

    /**
     * 
     * @param {Integer} kind 
     * @returns {HRESULT} 
     */
    MarkFeed(kind) {
        result := ComCall(6, this, "int", kind, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} percentage 
     * @returns {HRESULT} 
     */
    CutPaper(percentage) {
        result := ComCall(7, this, "double", percentage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CutPaperDefault() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

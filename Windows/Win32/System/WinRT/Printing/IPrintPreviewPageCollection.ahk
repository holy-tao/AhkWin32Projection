#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintPreviewPageCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPreviewPageCollection
     * @type {Guid}
     */
    static IID => Guid("{0b31cc62-d7ec-4747-9d6e-f2537d870f2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Paginate", "MakePage"]

    /**
     * 
     * @param {Integer} currentJobPage 
     * @param {IInspectable} printTaskOptions 
     * @returns {HRESULT} 
     */
    Paginate(currentJobPage, printTaskOptions) {
        result := ComCall(3, this, "uint", currentJobPage, "ptr", printTaskOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} desiredJobPage 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {HRESULT} 
     */
    MakePage(desiredJobPage, width, height) {
        result := ComCall(4, this, "uint", desiredJobPage, "float", width, "float", height, "HRESULT")
        return result
    }
}

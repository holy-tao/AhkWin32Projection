#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintTaskOptionDetails.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptionDetailsStatic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptionDetailsStatic
     * @type {Guid}
     */
    static IID => Guid("{135da193-0961-4b6e-8766-f13b7fbccd58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFromPrintTaskOptions"]

    /**
     * 
     * @param {PrintTaskOptions} printTaskOptions_ 
     * @returns {PrintTaskOptionDetails} 
     */
    GetFromPrintTaskOptions(printTaskOptions_) {
        result := ComCall(6, this, "ptr", printTaskOptions_, "ptr*", &printTaskOptionDetails_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskOptionDetails(printTaskOptionDetails_)
    }
}

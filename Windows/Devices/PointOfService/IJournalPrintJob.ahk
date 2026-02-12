#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IJournalPrintJob extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJournalPrintJob
     * @type {Guid}
     */
    static IID => Guid("{9f4f2864-f3f0-55d0-8c39-74cc91783eed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Print", "FeedPaperByLine", "FeedPaperByMapModeUnit"]

    /**
     * Neural networks for regression modeling and for Binary and multi-class classification.
     * @param {HSTRING} data 
     * @param {PosPrinterPrintOptions} printOptions 
     * @returns {HRESULT} A [`NeuralNetwork`](learners-object.md) object with the trained model.
     * @see https://learn.microsoft.com/sql/ocs/docs/machine-learning/python/reference/microsoftml/rx-neural-network
     */
    Print(data, printOptions) {
        if(data is String) {
            pin := HSTRING.Create(data)
            data := pin.Value
        }
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(6, this, "ptr", data, "ptr", printOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lineCount 
     * @returns {HRESULT} 
     */
    FeedPaperByLine(lineCount) {
        result := ComCall(7, this, "int", lineCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} distance 
     * @returns {HRESULT} 
     */
    FeedPaperByMapModeUnit(distance) {
        result := ComCall(8, this, "int", distance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

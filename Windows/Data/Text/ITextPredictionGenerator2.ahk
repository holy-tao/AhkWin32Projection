#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ITextPredictionGenerator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextPredictionGenerator2
     * @type {Guid}
     */
    static IID => Guid("{b84723b8-2c77-486a-900a-a3453eedc15d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCandidatesWithParametersAsync", "GetNextWordCandidatesAsync", "get_InputScope", "put_InputScope"]

    /**
     * @type {Integer} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Integer} maxCandidates 
     * @param {Integer} predictionOptions 
     * @param {IIterable<HSTRING>} previousStrings 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    GetCandidatesWithParametersAsync(input_, maxCandidates, predictionOptions, previousStrings) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(6, this, "ptr", input_, "uint", maxCandidates, "uint", predictionOptions, "ptr", previousStrings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), result_)
    }

    /**
     * 
     * @param {Integer} maxCandidates 
     * @param {IIterable<HSTRING>} previousStrings 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    GetNextWordCandidatesAsync(maxCandidates, previousStrings) {
        result := ComCall(7, this, "uint", maxCandidates, "ptr", previousStrings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputScope() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\TextPhoneme.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ITextReverseConversionGenerator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextReverseConversionGenerator2
     * @type {Guid}
     */
    static IID => Guid("{1aafd2ec-85d6-46fd-828a-3a4830fa6e18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPhonemesAsync"]

    /**
     * 
     * @param {HSTRING} input_ 
     * @returns {IAsyncOperation<IVectorView<TextPhoneme>>} 
     */
    GetPhonemesAsync(input_) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(6, this, "ptr", input_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, TextPhoneme), result_)
    }
}

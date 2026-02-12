#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ITextPredictionGenerator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextPredictionGenerator
     * @type {Guid}
     */
    static IID => Guid("{5eacab07-abf1-4cb6-9d9e-326f2b468756}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResolvedLanguage", "get_LanguageAvailableButNotInstalled", "GetCandidatesAsync", "GetCandidatesWithMaxCountAsync"]

    /**
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * @type {Boolean} 
     */
    LanguageAvailableButNotInstalled {
        get => this.get_LanguageAvailableButNotInstalled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LanguageAvailableButNotInstalled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    GetCandidatesAsync(input_) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(8, this, "ptr", input_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), result_)
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Integer} maxCandidates 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    GetCandidatesWithMaxCountAsync(input_, maxCandidates) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(9, this, "ptr", input_, "uint", maxCandidates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), result_)
    }
}

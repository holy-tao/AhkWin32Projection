#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\KeyboardInputProcessor.ahk
#Include .\TextInputProvider.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextInputService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextInputService
     * @type {Guid}
     */
    static IID => Guid("{8e23f89c-ab1f-551a-8751-7d4f29e34d88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateKeyboardInputProcessor", "CreateTextInputProvider"]

    /**
     * 
     * @param {HSTRING} inputProfile 
     * @returns {KeyboardInputProcessor} 
     */
    CreateKeyboardInputProcessor(inputProfile) {
        if(inputProfile is String) {
            pin := HSTRING.Create(inputProfile)
            inputProfile := pin.Value
        }
        inputProfile := inputProfile is Win32Handle ? NumGet(inputProfile, "ptr") : inputProfile

        result := ComCall(6, this, "ptr", inputProfile, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyboardInputProcessor(result_)
    }

    /**
     * 
     * @param {HSTRING} inputProfile 
     * @returns {TextInputProvider} 
     */
    CreateTextInputProvider(inputProfile) {
        if(inputProfile is String) {
            pin := HSTRING.Create(inputProfile)
            inputProfile := pin.Value
        }
        inputProfile := inputProfile is Win32Handle ? NumGet(inputProfile, "ptr") : inputProfile

        result := ComCall(7, this, "ptr", inputProfile, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextInputProvider(result_)
    }
}

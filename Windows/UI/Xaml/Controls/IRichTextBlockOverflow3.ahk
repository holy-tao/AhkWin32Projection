#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockOverflow3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockOverflow3
     * @type {Guid}
     */
    static IID => Guid("{7f69587b-5c7f-4b5f-bdbc-fb95c90e10de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTextTrimmed", "add_IsTextTrimmedChanged", "remove_IsTextTrimmedChanged"]

    /**
     * @type {Boolean} 
     */
    IsTextTrimmed {
        get => this.get_IsTextTrimmed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextTrimmed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<RichTextBlockOverflow, IsTextTrimmedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsTextTrimmedChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsTextTrimmedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

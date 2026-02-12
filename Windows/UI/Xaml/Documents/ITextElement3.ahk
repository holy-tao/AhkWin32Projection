#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextElement3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextElement3
     * @type {Guid}
     */
    static IID => Guid("{d1db340f-1bc4-4ca8-bcf7-770bff9b27ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowFocusOnInteraction", "put_AllowFocusOnInteraction", "get_AccessKey", "put_AccessKey", "get_ExitDisplayModeOnAccessKeyInvoked", "put_ExitDisplayModeOnAccessKeyInvoked"]

    /**
     * @type {Boolean} 
     */
    AllowFocusOnInteraction {
        get => this.get_AllowFocusOnInteraction()
        set => this.put_AllowFocusOnInteraction(value)
    }

    /**
     * @type {HSTRING} 
     */
    AccessKey {
        get => this.get_AccessKey()
        set => this.put_AccessKey(value)
    }

    /**
     * @type {Boolean} 
     */
    ExitDisplayModeOnAccessKeyInvoked {
        get => this.get_ExitDisplayModeOnAccessKeyInvoked()
        set => this.put_ExitDisplayModeOnAccessKeyInvoked(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowFocusOnInteraction() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowFocusOnInteraction(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessKey() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccessKey(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExitDisplayModeOnAccessKeyInvoked() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExitDisplayModeOnAccessKeyInvoked(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

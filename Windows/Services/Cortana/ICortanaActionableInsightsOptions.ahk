#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class ICortanaActionableInsightsOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICortanaActionableInsightsOptions
     * @type {Guid}
     */
    static IID => Guid("{aac2bbcf-9782-5420-b81e-7ae56af31815}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentSourceWebLink", "put_ContentSourceWebLink", "get_SurroundingText", "put_SurroundingText"]

    /**
     * @type {Uri} 
     */
    ContentSourceWebLink {
        get => this.get_ContentSourceWebLink()
        set => this.put_ContentSourceWebLink(value)
    }

    /**
     * @type {HSTRING} 
     */
    SurroundingText {
        get => this.get_SurroundingText()
        set => this.put_SurroundingText(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceWebLink() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentSourceWebLink(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SurroundingText() {
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
    put_SurroundingText(value) {
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
}

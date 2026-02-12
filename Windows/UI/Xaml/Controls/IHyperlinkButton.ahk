#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHyperlinkButton extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHyperlinkButton
     * @type {Guid}
     */
    static IID => Guid("{ccebaca3-3b5c-4f4c-9bfd-86887bc79772}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NavigateUri", "put_NavigateUri"]

    /**
     * @type {Uri} 
     */
    NavigateUri {
        get => this.get_NavigateUri()
        set => this.put_NavigateUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_NavigateUri() {
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
    put_NavigateUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

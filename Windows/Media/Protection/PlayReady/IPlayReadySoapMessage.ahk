#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadySoapMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadySoapMessage
     * @type {Guid}
     */
    static IID => Guid("{b659fcb5-ce41-41ba-8a0d-61df5fffa139}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMessageBody", "get_MessageHeaders", "get_Uri"]

    /**
     * @type {IPropertySet} 
     */
    MessageHeaders {
        get => this.get_MessageHeaders()
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * 
     * @param {Pointer<Pointer>} messageBodyBytes 
     * @returns {HRESULT} 
     */
    GetMessageBody(messageBodyBytes) {
        result := ComCall(6, this, "ptr", messageBodyBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_MessageHeaders() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(8, this, "ptr*", &messageUri := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(messageUri)
    }
}

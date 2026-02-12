#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageNotificationTriggerDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageNotificationTriggerDetails2
     * @type {Guid}
     */
    static IID => Guid("{6bb522e0-aa07-4fd1-9471-77934fb75ee6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldDisplayToast", "get_ShouldUpdateDetailText", "get_ShouldUpdateBadge", "get_ShouldUpdateActionCenter"]

    /**
     * @type {Boolean} 
     */
    ShouldDisplayToast {
        get => this.get_ShouldDisplayToast()
    }

    /**
     * @type {Boolean} 
     */
    ShouldUpdateDetailText {
        get => this.get_ShouldUpdateDetailText()
    }

    /**
     * @type {Boolean} 
     */
    ShouldUpdateBadge {
        get => this.get_ShouldUpdateBadge()
    }

    /**
     * @type {Boolean} 
     */
    ShouldUpdateActionCenter {
        get => this.get_ShouldUpdateActionCenter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldDisplayToast() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldUpdateDetailText() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldUpdateBadge() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldUpdateActionCenter() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

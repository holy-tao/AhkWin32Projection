#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IRcsEndUserMessageAction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsEndUserMessageAction
     * @type {Guid}
     */
    static IID => Guid("{92378737-9b42-46d3-9d5e-3c1b2dae7cb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Label"]

    /**
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

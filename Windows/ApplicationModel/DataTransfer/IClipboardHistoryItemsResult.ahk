#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ClipboardHistoryItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IClipboardHistoryItemsResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClipboardHistoryItemsResult
     * @type {Guid}
     */
    static IID => Guid("{e6dfdee6-0ee2-52e3-852b-f295db65939a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Items"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IVectorView<ClipboardHistoryItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<ClipboardHistoryItem>} 
     */
    get_Items() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ClipboardHistoryItem, value)
    }
}

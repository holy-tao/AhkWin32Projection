#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\GeneratorPosition.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IItemsChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e8b45568-7d10-421e-be29-81839a91de20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action", "get_Position", "get_OldPosition", "get_ItemCount", "get_ItemUICount"]

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {GeneratorPosition} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {GeneratorPosition} 
     */
    OldPosition {
        get => this.get_OldPosition()
    }

    /**
     * @type {Integer} 
     */
    ItemCount {
        get => this.get_ItemCount()
    }

    /**
     * @type {Integer} 
     */
    ItemUICount {
        get => this.get_ItemUICount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GeneratorPosition} 
     */
    get_Position() {
        value := GeneratorPosition()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GeneratorPosition} 
     */
    get_OldPosition() {
        value := GeneratorPosition()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCount() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemUICount() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

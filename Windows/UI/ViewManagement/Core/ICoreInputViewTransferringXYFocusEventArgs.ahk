#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInputViewTransferringXYFocusEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputViewTransferringXYFocusEventArgs
     * @type {Guid}
     */
    static IID => Guid("{04de169f-ba02-4850-8b55-d82d03ba6d7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Origin", "get_Direction", "put_TransferHandled", "get_TransferHandled", "put_KeepPrimaryViewVisible", "get_KeepPrimaryViewVisible"]

    /**
     * @type {RECT} 
     */
    Origin {
        get => this.get_Origin()
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * @type {Boolean} 
     */
    TransferHandled {
        get => this.get_TransferHandled()
        set => this.put_TransferHandled(value)
    }

    /**
     * @type {Boolean} 
     */
    KeepPrimaryViewVisible {
        get => this.get_KeepPrimaryViewVisible()
        set => this.put_KeepPrimaryViewVisible(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Origin() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_TransferHandled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransferHandled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_KeepPrimaryViewVisible(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeepPrimaryViewVisible() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

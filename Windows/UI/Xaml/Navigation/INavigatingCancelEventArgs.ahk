#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class INavigatingCancelEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigatingCancelEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fd1d67ae-eafb-4079-be80-6dc92a03aedf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Cancel", "put_Cancel", "get_NavigationMode", "get_SourcePageType"]

    /**
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * @type {Integer} 
     */
    NavigationMode {
        get => this.get_NavigationMode()
    }

    /**
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
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
    put_Cancel(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NavigationMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        value := TypeName()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

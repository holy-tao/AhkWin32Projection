#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IEffectiveViewportChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEffectiveViewportChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{55ee2e81-1c18-59ed-bd3d-c4ca8fa7d190}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EffectiveViewport", "get_MaxViewport", "get_BringIntoViewDistanceX", "get_BringIntoViewDistanceY"]

    /**
     * @type {RECT} 
     */
    EffectiveViewport {
        get => this.get_EffectiveViewport()
    }

    /**
     * @type {RECT} 
     */
    MaxViewport {
        get => this.get_MaxViewport()
    }

    /**
     * @type {Float} 
     */
    BringIntoViewDistanceX {
        get => this.get_BringIntoViewDistanceX()
    }

    /**
     * @type {Float} 
     */
    BringIntoViewDistanceY {
        get => this.get_BringIntoViewDistanceY()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_EffectiveViewport() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_MaxViewport() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BringIntoViewDistanceX() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BringIntoViewDistanceY() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

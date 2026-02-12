#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Accessibility
 * @version WindowsRuntime 1.4
 */
class IScreenReaderPositionChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScreenReaderPositionChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{557eb5e5-54d0-5ccd-9fc5-ed33357f8a9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ScreenPositionInRawPixels", "get_IsReadingText"]

    /**
     * @type {RECT} 
     */
    ScreenPositionInRawPixels {
        get => this.get_ScreenPositionInRawPixels()
    }

    /**
     * @type {Boolean} 
     */
    IsReadingText {
        get => this.get_IsReadingText()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ScreenPositionInRawPixels() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadingText() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

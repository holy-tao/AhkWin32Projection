#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IJapanesePhoneme extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJapanesePhoneme
     * @type {Guid}
     */
    static IID => Guid("{2f6a9300-e85b-43e6-897d-5d82f862df21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayText", "get_YomiText", "get_IsPhraseStart"]

    /**
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * @type {HSTRING} 
     */
    YomiText {
        get => this.get_YomiText()
    }

    /**
     * @type {Boolean} 
     */
    IsPhraseStart {
        get => this.get_IsPhraseStart()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_YomiText() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPhraseStart() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppTextWithLanguage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppTextWithLanguage
     * @type {Guid}
     */
    static IID => Guid("{326447a6-5149-5936-90e8-0c736036bf77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Language", "get_Value"]

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
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
    get_Value() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

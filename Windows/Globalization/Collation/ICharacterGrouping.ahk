#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.Collation
 * @version WindowsRuntime 1.4
 */
class ICharacterGrouping extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICharacterGrouping
     * @type {Guid}
     */
    static IID => Guid("{fae761bb-805d-4bb0-95bb-c1f7c3e8eb8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_First", "get_Label"]

    /**
     * @type {HSTRING} 
     */
    First {
        get => this.get_First()
    }

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
    get_First() {
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
    get_Label() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

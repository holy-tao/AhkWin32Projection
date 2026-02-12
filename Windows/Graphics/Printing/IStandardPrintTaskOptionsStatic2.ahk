#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IStandardPrintTaskOptionsStatic2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardPrintTaskOptionsStatic2
     * @type {Guid}
     */
    static IID => Guid("{3be38bf4-7a44-4269-9a52-81261e289ee9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bordering"]

    /**
     * @type {HSTRING} 
     */
    Bordering {
        get => this.get_Bordering()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bordering() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

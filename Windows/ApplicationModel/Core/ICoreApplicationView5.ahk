#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreApplicationView5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplicationView5
     * @type {Guid}
     */
    static IID => Guid("{2bc095a8-8ef0-446d-9e60-3a3e0428c671}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Properties"]

    /**
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }
}

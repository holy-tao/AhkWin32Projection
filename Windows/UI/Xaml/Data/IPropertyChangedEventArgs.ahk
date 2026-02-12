#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IPropertyChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4f33a9a0-5cf4-47a4-b16f-d7faaf17457e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertyName"]

    /**
     * @type {HSTRING} 
     */
    PropertyName {
        get => this.get_PropertyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PropertyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
